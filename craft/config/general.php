<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */


return array(

  '*' => array(
    'omitScriptNameInUrls' => true
  ),

  'craft-demo.com' => array(

    'allowAutoUpdates' => false,

    'environmentVariables' => array(
      'siteUrl'        => 'http://www.craft-demo.com/',
      'fileSystemPath' => 'assets/'
    )
  ),

  'dev.craft-demo.com' => array(
    
    'devMode' => true,
    'allowAutoUpdates' => true,

    'environmentVariables' => array(
      'siteUrl'        => 'http://dev.craft-demo.com/',
      'fileSystemPath' => 'assets/'
    )
  )
);
