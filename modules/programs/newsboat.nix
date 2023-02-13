{ config, pkgs, ... }:

{
    programs.newsboat = {
        enable = true;
        autoReload = true;
        browser = "${pkgs.firefox}/bin/firefox";
        reloadTime = 180;
        urls = [
            { url = "https://www.daad.de/feeds/de/daad-aktuell.xml";  }
            { url = "https://www.deutschlandfunk.de/kulturportal-100.rss";  }
            { url = "https://www.goethe.de/ins/eg/de/rss/mag.rss";  }
            { url = "https://www.goethe.de/ins/eg/de/rss/kai/ver.rss";  }
            { url = "https://www.goethe.de/ins/eg/de/rss/alx/ver.rss"; }
            { url = "https://www.tutomena.com//rss.xml";  }
            { url = "https://blog.abdelhadi.org/rss.xml"; }
            { url = "https://hausaba.com/feed/"; }
            { url = "https://mhsabbagh.com/feed/"; }
            { url = "https://yshalsager.com/ar/rss.xml"; }
            { url = "https://feras.ws/feed/"; }
            { url = "https://smallpages.blog/feed/"; }
            { url = "https://www.nawalsaad.com/?feed=rss2"; }
            { url = "https://watheq.xyz/feed.xml"; }
            { url = "https://egyptinnovate.com/feeds"; }
            { url = "https://blog.mahmoud-salem.net/rss.xml"; }
            { url = "https://feeds.feedburner.com/TheHackersNews"; }
            { url = "https://weekly.nixos.org/feeds/all.rss.xml"; }
            { url = "https://peppe.rs/index.xml"; }
            { url = "https://martinheinz.dev/rss"; }
            { url = "https://icyphox.sh/blog/feed.xml"; }
            { url = "https://noqqe.de/index.xml"; }
            { url = "https://notes.abhinavsarkar.net/feed.atom"; }
            { url = "https://abhinavsarkar.net/feed.atom"; }
            { url = "https://a.custura.eu/index.xml"; }
            { url = "https://garethklose.com/feed"; }
            { url = "https://mgdm.net/atom.xml"; }
            { url = "https://lodge.glasgownet.com/feed/"; }
            { url = "https://grahamc.com/feed/"; }
            { url = "https://popey.com/blog/index.xml"; }
            { url = "https://www.foxk.it/index.xml"; }
            { url = "https://irl.xyz/index.xml"; }
            { url = "https://blog.sekun.dev/posts/index.xml"; }
            { url = "https://reflexivereflection.com/rss.xml"; }
            { url = "https://ianthehenry.com/feed.xml"; }
            { url = "https://ittavern.com/rss.xml"; }
            { url = "https://cblgh.org/all.xml"; }
            { url = "https://kevquirk.com/feed.xml"; }
            { url = "https://castel.dev/rss.xml"; }
            { url = "https://www.ertt.ca/feed.atom"; }
            { url = "https://blog.unhappyfolk.org/index.xml"; }
            { url = "https://moftasa.net/feeds/rss.xml"; }
            { url = "http://feeds.feedburner.com/thingfromuntil/iUjL"; }
            { url = "https://blog.sekun.dev/posts/index.xml"; }
            { url = "https://www.kuketz-blog.de/feed/"; }
        ];
        extraConfig = ''
            # unbind defaults
            unbind-key ENTER
            unbind-key h
            unbind-key j
            unbind-key k
            unbind-key l
            # vim style movement
            bind-key h quit
            bind-key j down
            bind-key k up
            bind-key l open
            # home/end
            unbind-key g
            bind-key g home
            unbind-key G
            bind-key G end
        '';
    };
}
