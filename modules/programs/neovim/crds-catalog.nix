{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  name = "crds-catalog";

  src = pkgs.fetchFromGitHub {
    owner = "datreeio";
    repo = "CRDs-catalog";
    rev = "553f0527c94a5f9802989aad4ac7b4073074896d";
    sha256 = "sha256-+OcxUy6DtzaxDMH6YzRrugMSQj8pozeWOUUlIMQBvMM=";
  };

  buildPhase = ''
    echo "Processing CRDs catalog..."
  '';

  installPhase = ''
    mkdir -p $out/schemas
    # Copy all JSON schema files, preserving directory structure
    find . -name "*.json" -type f | while read -r file; do
      # Remove leading ./ and copy to output
      target="$out/schemas/''${file#./}"
      mkdir -p "$(dirname "$target")"
      cp "$file" "$target"
    done
    
    # Create a catalog file for easy discovery
    find $out/schemas -name "*.json" | sed "s|$out/schemas/||" | sort > $out/catalog.txt
    
    echo "Found $(wc -l < $out/catalog.txt) CRD schemas"
  '';

  meta = with pkgs.lib; {
    description = "Kubernetes CRDs catalog schemas";
    homepage = "https://github.com/datreeio/CRDs-catalog";
    license = licenses.mit;
    maintainers = [ ];
  };
}
