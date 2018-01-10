<?php 

require_once dirname(__FILE__).'/PHPWord-master/src/PhpWord/Autoloader.php';
\PhpOffice\PhpWord\Autoloader::register();

use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\Style\Font;

$document = new PhpWord();

if(isset($_SESSION['choix_creation'])) {
	
	/*************************** STYLES ***************************/

	//Style titre page de garde
	$document->addFontStyle('title_p_garde', array('bold' => true, 'size' => 30, 'allCaps' => true, 'color' => '#1034A6', 'align'=>'center'));
	$document->addParagraphStyle('center', array('size' => 12, 'align'=>'center', 'spaceAfter'=>100));
	$document->addFontStyle('title_partie', array('bold' => true, 'size' => 25, 'allCaps' => true, 'color' => '#107fb7'));
	$document->addFontStyle('subtitle_p_garde', array('bold' => true, 'size' => 20, 'color' => '#0F9DE8'));
	$document->addFontStyle('coord_contr', array('italic' => true, 'size' => 8));
	$document->addFontStyle('conclu', array('italic' => true, 'size' => 11));
	$document->addFontStyle('coord_audit', array('size' => 12));

	
	$document->addFontStyle('introFstyle', array('bold'=>true, 'italic'=>false, 'size'=>12));
	$document->addParagraphStyle('introPstyle', array('align'=>'center', 'spaceAfter'=>100));
	
	$document->addFontStyle('tabFont', array('bold'=>true, 'italic'=>false, 'size'=>12));
	$document->addParagraphStyle('tabPar', array('align'=>'left', 'spaceAfter'=>10));
	
	//Style infos cdg87
	$document->addFontStyle('foot_cdg', array('size' => 10, 'color' => '#000000'));

	//style couleur observations
	$document->addFontStyle('obs_color_v', array('color' => 'green'));
	$document->addFontStyle('obs_color_r', array('color' => 'red'));
	//style petits titres (theme, sous-theme, critere)
	$document->addFontStyle('titre_infos_partie', array('size' => 16, 'color' => '666666'));

	// Define the TOC font style
	$fontStyle = array('spaceAfter' => 60, 'size' => 12);

	// Add title styles
	$document->setDefaultParagraphStyle(array('align'=>'left','spaceAfter'=>1));
	$document->addParagraphStyle('st1',array('spaceBefore'=>170,'spaceAfter'=>100));
	$document->addTitleStyle(1, array('bold' => true, 'size' => 25, 'allCaps' => true, 'color' => '#107fb7')); 		//titres
	$document->addTitleStyle(3, array('underline' => 'single', 'align'=>'center', 'size' => 20, 'color' => '333333', 'bold' => true));
	 //titres
	$document->addTitleStyle(2, array('size' => 16, 'color' => '666666'));
	//sous-titres


	// Define table style arrays
	$styleTable = array('borderSize'=>0, 'borderColor'=>'ffffff', 'cellMargin'=>80);
	$styleTable2 = array('borderSize'=>6, 'borderColor'=>'000000', 'cellMargin'=>800,'borderCollapse'=>'separate', 'borderSpacing'=>300);
	// Define cell style arrays
	$styleCell = array('valign'=>'center');
	// Add table style
	$document->addTableStyle('myOwnTableStyle', $styleTable);
	$document->addTableStyle('myOwnTableStyle2', $styleTable2);
	
	
	/*************************** SECTION ***************************/

	//Section
	$section = $document->addSection();


	/*************************** HEADER ***************************/


	// Add first page header
	$header = $section->addHeader();
	$header->firstPage();
	$table = $header->addTable();
	$table->addRow();
	$cell = $table->addCell(4500);
	$textrun = $cell->addTextRun();
	$textrun->addText("Pôle Santé et Sécurité au Travail", 'pole');
	$textrun->addTextBreak(1);
	$textrun->addText("Service Prévention des Risques Professionnels");
	$table->addCell(4500)->addImage(
		'images/logo_cdg.jpg',
		array('width' => 180, 'align' => 'right')
	);
	
	$section->addTextBreak(5);
		$section->addText("Releve", 'title_p_garde', 'center'); //titre page de garde
		$section->addText("De mesures urgentes", 'title_p_garde', 'center'); //titre page de garde
		
		$section->addText("Art-5: L'ACFI est informé par l'Autorité Territoriale des suites données à ses propositions",  'introFstyle', 'introPstyle');
			$section->addTextBreak(2);
			$section->addText(htmlspecialchars("Organisationnel"),'subtitle_p_garde');
			foreach($lesInfosCriteresCoOrg as $uneInfoCritereCoOrg) {
				
				if($uneInfoCritereCoOrg['VALEUR_IMPORTANT'] == 1 && ( $uneInfoCritereCoOrg['VALEUR_CRITERE'] == 'NC' || $uneInfoCritereCoOrg['VALEUR_CRITERE'] == '<C')) {$section->addLine(['weight' => 2, 'width' => 600, 'height' => 0]);
				$sstheme='';
					foreach($lesSTCr as $unSTCr) {
						
						if($unSTCr['NUM_CRITERE'] == $uneInfoCritereCoOrg['NUM_CRITERE']) {
							//Theme - Sous-thème
							
							$sstheme=$unSTCr['LIBELLE_SOUS_THEME'];
						}
						
					}
					if($sstheme!=''){
						$section->addText(htmlspecialchars($uneInfoCritereCoOrg['NOM_THEME']." - ".$sstheme), $menu2, 'st1');
						$section->addText(htmlspecialchars("► ".$uneInfoCritereCoOrg['LIBELLE_CRITERE']), $menu2, 'st1');
					}else{
						$section->addText(htmlspecialchars($uneInfoCritereCoOrg['NOM_THEME']), $menu2, 'st1');
						$section->addText(htmlspecialchars("► ".$uneInfoCritereCoOrg['LIBELLE_CRITERE']), $menu2, 'st1');
						
					}

					
					//Observations
					$section->addText(htmlspecialchars("Observations : "), $menu, 'st1');
					foreach($lesObservationsOrg as $uneObservationOrg) {
						
						if($uneObservationOrg['NUM_CRITERE'] == $uneInfoCritereCoOrg['NUM_CRITERE']) {
							if($uneObservationOrg['CODE_COULEUR_OBSERVATION'] == 1) { //vert
								$section->addText(htmlspecialchars($uneObservationOrg['LIBELLE_OBSERVATION']), 'obs_color_v');
							}else { //rouge
								$section->addText(htmlspecialchars($uneObservationOrg['LIBELLE_OBSERVATION']), 'obs_color_r');
							}
						}
					}
					
					//Préconisations
					$section->addText(htmlspecialchars("Propositions : "), $menu, 'st1');
					foreach($lesPreconisationsOrg as $unePreconisationOrg) {
						if($unePreconisationOrg['NUM_CRITERE'] == $uneInfoCritereCoOrg['NUM_CRITERE']) {
							$section->addText(htmlspecialchars($unePreconisationOrg['LIBELLE_PRECONISATION']));
						}
						
					}
					$section->addText(htmlspecialchars($uneInfoCritereCoOrg['PRECONISATION_CRITERE']));
				}
				$section->addTextBreak(2);
			}
			
			
			$section->addPageBreak();

			$section->addText(htmlspecialchars("Sur site"),'subtitle_p_garde');
			foreach($lesInfosCriteresCoSite as $uneInfoCritereCoSite) {
				
				if($uneInfoCritereCoSite['VALEUR_IMPORTANT'] == 1 && ( $uneInfoCritereCoSite['VALEUR_CRITERE'] == 'NC' || $uneInfoCritereCoSite['VALEUR_CRITERE'] == '<C')) {
					$section->addLine(['weight' => 2, 'width' => 600, 'height' => 0]);
				$sstheme='';
					//batiment - lieu
					foreach($lesSTCr as $unSTCr) {
						if($unSTCr['NUM_CRITERE'] == $uneInfoCritereCoSite['NUM_CRITERE']) {
							//Sous-thème
							$sstheme=$unSTCr['LIBELLE_SOUS_THEME'];
						}
					}
					if($sstheme!=''){
						$section->addText(htmlspecialchars($uneInfoCritereCoSite['NOM_BATIMENT']." - ".$uneInfoCritereCoSite['NOM_LIEU']),$menu1,'st1');
						$section->addText(htmlspecialchars($uneInfoCritereCoSite['NOM_THEME']." - ".$sstheme), $menu2, 'st1');
						$section->addText(htmlspecialchars("► ".$uneInfoCritereCoSite['LIBELLE_CRITERE']), $menu2, 'st1');
					}else{
						$section->addText(htmlspecialchars($uneInfoCritereCoSite['NOM_BATIMENT']." - ".$uneInfoCritereCoSite['NOM_LIEU']),$menu1,'st1');
						$section->addText(htmlspecialchars($uneInfoCritereCoSite['NOM_THEME']), $menu2, 'st1');
						$section->addText(htmlspecialchars("► ".$uneInfoCritereCoSite['LIBELLE_CRITERE']), $menu2, 'st1');
					}
					
					//Observations
					$section->addText(htmlspecialchars("Observations : "), $menu, 'st1');
					foreach($lesObservationsSite as $uneObservationSite) {
						
						if($uneObservationSite['NUM_BATIMENT_C'] == $uneInfoCritereCoSite['NUM_BATIMENT_C'] and $uneObservationSite['NUM_CRITERE_C'] == $uneInfoCritereCoSite['NUM_CRITERE'] and $uneObservationSite['NUM_LIEU'] == $uneInfoCritereCoSite['NUM_LIEU']) {
							if($uneObservationSite['CODE_COULEUR_OBSERVATION'] == 1) { //vert
								$section->addText(htmlspecialchars($uneObservationSite['LIBELLE_OBSERVATION']), 'obs_color_v');
							}else { //rouge
								$section->addText(htmlspecialchars($uneObservationSite['LIBELLE_OBSERVATION']), 'obs_color_r');
							}
						}
					}
					
					//Préconisations
					$section->addText(htmlspecialchars("Propositions : "), $menu, 'st1');
						foreach($lesPreconisationsSite as $unePreconisationSite) {
							if($unePreconisationSite['NUM_BATIMENT_C'] == $uneInfoCritereCoSite['NUM_BATIMENT_C'] && $unePreconisationSite['NUM_CRITERE_C'] == $uneInfoCritereCoSite['NUM_CRITERE']) {
								$section->addText(htmlspecialchars($unePreconisationSite['LIBELLE_PRECONISATION']));
							}	
						}
				}
					$section->addTextBreak(2);
			}
			
			$section->addPageBreak(); //saut de page
			
			$tablette = $section->addTable('myOwnTableStyle');
				$tablette->addRow();
					$cell = $tablette->addCell(5000);
					$cell->addText(htmlspecialchars("Nom et signature de l'ACFI : "));
					$cell = $tablette->addCell(5000);
					$cell->addText(htmlspecialchars("Nom et signature de l'Autorité territoriale ou de son représentant le jour de l'inspection :"));
			$tablette2 = $section->addTable('myOwnTableStyle2');
				$tablette2->addRow();
					$cell = $tablette2->addCell(4400);
					$cell->addText(htmlspecialchars(" "));

					$cell = $tablette2->addCell(4600);
					$cell->addText(htmlspecialchars(" "));	
}
		
	
	/*************************** FOOTER ***************************/


	// Add footer
	$footer = $section->addFooter();

	$footer->addPreserveText(htmlspecialchars('Page {PAGE}/{NUMPAGES}'), array('align' => 'right'));




	//Guardando document
	$objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($document, 'Word2007');
	$objWriter->save('Rapport '.$uneInfoStructure['VILLE_STRUCTURE'].'.docx');

	header("Content-Disposition: attachment; filename='Rapport ".$uneInfoStructure['VILLE_STRUCTURE'].".docx'");
	echo file_get_contents('Rapport '.$uneInfoStructure['VILLE_STRUCTURE'].'.docx');

?>
