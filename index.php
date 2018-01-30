<?php 
		$servername = "localhost";
		$username = "root";
		$mysql_database = 'base_inspection_cdg';
		$password = "";
		$filename = 'base_inspection_cdg.sql';

		// Create connection
		$conn = new mysqli($servername, $username, $password);
		
		// Check connection
		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		} 
		
		$sql = "SHOW DATABASES LIKE 'base_inspection_cdg'";
		$verifBD=$conn->query($sql);
		$row = $verifBD->fetch_row();
		if($row[0]!='base_inspection_cdg'){
			// Create database
			$sql = "CREATE DATABASE IF NOT EXISTS base_inspection_cdg";
			if ($conn->query($sql) == TRUE) {
				echo "Database created successfully";	
			
				// Connect to MySQL server
				@mysql_connect($servername, $username, $password) or die('Error connecting to MySQL server: ' . mysql_error());
				// Select database
				mysql_select_db($mysql_database) or die('Error selecting MySQL database: ' . mysql_error());

				// Temporary variable, used to store current query
				$templine = '';
				// Read in entire file
				$lines = file($filename);
				// Loop through each line
				foreach ($lines as $line){
					// Skip it if it's a comment
					if (substr($line, 0, 2) == '--' || $line == '')
						continue;

					// Add this line to the current segment
					$templine .= $line;
					// If it has a semicolon at the end, it's the end of the query
					if (substr(trim($line), -1, 1) == ';')
					{
						// Perform the query
						mysql_query($templine) /*or print('Error performing query \'<strong>' . $templine . '\': ' . mysql_error() . '<br /><br />')*/;
						// Reset temp variable to empty
					$templine = '';
					}
				}
			}
		}
		$conn->close();






    require_once("include/inc_pdo_inspection.php");
    require_once("include/inc_fonctions.php");

    session_start();
    $estConnecte = estConnecte();
    $pdo = new Pdo_Inspection();
    if(!isset($_REQUEST['uc']) || !$estConnecte){
        $_REQUEST['uc'] = 'connexion';
    }
    $uc = $_REQUEST['uc'];

    switch($uc) {
        
        case 'connexion' :
            include("controleur/c_connexion.php");
            break;
            
        case 'creation' : //création ou choix d'un audit
			include("controleur/c_creation.php");
            break;
        case 'maj': //mise a jour
			include("controleur/c_maj.php");
            break;
        case 'identification' : //saisies infos audit
            include("controleur/c_audit.php");
            break;
            
        case 'audit' :
            include("controleur/c_audit.php");
            break;
            
        case 'organisationnel' :
            include("controleur/c_organisationnel.php");
            break;
            
        case 'sursite' :
            include("controleur/c_sursite.php");
            break;
            
        case 'rapport' :
			include("controleur/c_rapport.php");
			break;
    }
    include("include/pied.php");
?>