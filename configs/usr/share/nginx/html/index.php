<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>Test Page for the Nginx HTTP Server on Rocky Linux</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style type="text/css">
      /*<![CDATA[*/
      body {
        background-color: #fff;
        color: #000;
        font-size: 0.9em;
        font-family: sans-serif, helvetica;
        margin: 0;
        padding: 0;
      }
      :link {
        color: #c00;
      }
      :visited {
        color: #c00;
      }
      a:hover {
        color: #f50;
      }
      h1 {
        text-align: center;
        margin: 0;
        padding: 0.6em 2em 0.4em;
        background-color: #10B981;
        color: #fff;
        font-weight: normal;
        font-size: 1.75em;
        border-bottom: 2px solid #000;
      }
      h1 strong {
        font-weight: bold;
        font-size: 1.5em;
      }
      h2 {
        text-align: center;
        background-color: #10B981;
        font-size: 1.1em;
        font-weight: bold;
        color: #fff;
        margin: 0;
        padding: 0.5em;
        border-bottom: 2px solid #000;
      }
      hr {
        display: none;
      }
      .content {
        padding: 1em 5em;
      }
      .alert {
        border: 2px solid #000;
      }

      img {
        border: 2px solid #fff;
        padding: 2px;
        margin: 2px;
      }
      a:hover img {
        border: 2px solid #294172;
      }
      .logos {
        margin: 1em;
        text-align: center;
      }
      /*]]>*/
    </style>
  </head>

  <body>
    <h1>Welcome to <strong>nginx</strong> on Rocky Linux!</h1>

    <div class="content">
      <p>
        This page is used to test the proper operation of the
        <strong>nginx</strong> HTTP server after it has been installed. If you
        can read this page, it means that the web server installed at this site
        is working properly.
      </p>

      <div class="alert">
        <h2>Website Administrator</h2>
        <div class="content">
          <p>
<ul>
<?php

        $dir = array_diff(scandir('/etc/nginx/sites-enabled/'), ['.','..']);

        foreach($dir as $v){
                $v = strstr($v,".conf", true);
                echo "<li><a href='view.php?file=/etc/nginx/sites-enabled/$v.conf'>$v.conf</a>  [<a href='http://$v'>LINK</a>]</li>";
        }
?>
</ul>

          </p>
        </div>
      </div>

      <div class="logos">
        <a href="http://nginx.net/"
          ><img
            src="nginx-logo.png"
            alt="[ Powered by nginx ]"
            width="121"
            height="32"
        /></a>
        <a href="http://www.rockylinux.org/"><img
            src="poweredby.png"
            alt="[ Powered by Rocky Linux ]"
            width="88" height="31" /></a>
        
      </div>
    </div>
  </body>
</html>
