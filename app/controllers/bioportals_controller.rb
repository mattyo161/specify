require 'bioportal'

class BioportalsController < ApplicationController
  def show
    @ontology_list = get_ontology_list
  end
  
  def get_ontology_list
    return [
        ["", 0],
        ["QUICK - Quantitative Imaging Biomarker Ontology (QIBO)", 46348],
        ["QUICK - Gene Ontology (GO)", 46349],
        ["QUICK - Gene Ontology Extension (GO)", 45890],
        ["QUICK - Foundational Model of Anatomy (FMA)", 44507],
        ["QUICK - SNOMED Clinical Terms (SNOMEDCT)", 46116],
        ["QUICK - RadLex (RID)", 45589],
        ["ABA Adult Mouse Brain (ABA)", 40133],
        ["AI/RHEUM (AIR)", 42298],
        ["Adverse Event Ontology (AEO)", 45534],
        ["Adverse Event Reporting ontology (AERO)", 46023],
        ["African Traditional Medicine (ATMO)", 40223],
        ["Amino Acid (amino-acid)", 44016],
        ["Amphibian gross anatomy (AAO)", 46012],
        ["Amphibian taxonomy (ATO)", 40791],
        ["Anatomical Entity Ontology (AEO)", 45288],
        ["Animal natural history and life history (ADW)", 44451],
        ["Ascomycete phenotype ontology (APO)", 46319],
        ["BIRNLex (birnlex)", 29684],
        ["BRENDA tissue / enzyme source (BTO)", 45790],
        ["Basic Formal Ontology (BFO)", 40358],
        ["Basic Vertebrate Anatomy (basic-vertebrate-gross-anatomy)", 4531],
        ["Bilateria anatomy (BILA)", 42455],
        ["BioAssay Ontology (BAO)", 45978],
        ["BioPAX (BP)", 44167],
        ["BioPortal Metadata (BPMetadata)", 42948],
        ["BioTop (BT)", 40937],
        ["Bioinformatics data, formats, identifiers, operations and topics (EDAM)", 45846],
        ["Biological imaging methods (FBbi)", 45792],
        ["Biomedical Resource Ontology (BRO)", 44450],
        ["Bleeding History Phenotype (BHO)", 45088],
        ["Body System (bodysystem)", 42651],
        ["Bone Dysplasia Ontology (BDO)", 46316],
        ["Breast Cancer Grading Ontology (BCGO)", 45776],
        ["Breast tissue cell lines (MCBCC)", 44178],
        ["Brucellosis Ontology (IDOBRU)", 46313],
        ["C. elegans development (WBls)", 45245],
        ["C. elegans gross anatomy (WBbt)", 46010],
        ["C. elegans phenotype (WBPhenotype)", 46344],
        ["COA (COA)", 45409],
        ["COSTART (CST)", 40390],
        ["CRISP Thesaurus, 2006 (CSP)", 44432],
        ["Cancer Research and Management ACGT Master Ontology (ACGT)", 42497],
        ["Cardiac Electrophysiology Ontology (EP)", 39038],
        ["Cell Behavior Ontology (CBO)", 39336],
        ["Cell Cycle Ontology (CCO)", 42983],
        ["Cell Line Ontology (CLO)", 45376],
        ["Cell line ontology (MCCL)", 39927],
        ["Cell line ontology (MCCL)", 44729],
        ["Cell type (CL)", 46163],
        ["Cereal Plant Development (GRO)", 13404],
        ["Cereal plant gross anatomy (GRO)", 46350],
        ["Chemical Information Ontology (CHEMINF)", 45415],
        ["Chemical entities of biological interest (CHEBI)", 46336],
        ["Clinical Measurement Ontology (CMO)", 45360],
        ["Cognitive Atlas (cogat)", 46220],
        ["Cognitive Paradigm Ontology (CogPO)", 44958],
        ["Common Anatomy Reference Ontology (CARO)", 46255],
        ["Common Terminology Criteria for Adverse Events (CTCAE)", 46081],
        ["Comparative Data Analysis Ontology (CDAO)", 40648],
        ["Computer-based Patient Record Ontology (CPR)", 39734],
        ["Crop Ontology (CO)", 44770],
        ["Current Procedural Terminology (CPT)", 42853],
        ["Dendritic cell (DC_CL)", 45252],
        ["DermLex: The Dermatology Lexicon (DermLex)", 39815],
        ["Dictyostelium discoideum anatomy (DDANAT)", 45398],
        ["Drosophila development (FBdv)", 45239],
        ["Drosophila gross anatomy (FBbt)", 45937],
        ["Electrocardiography Ontology (ECG)", 45835],
        ["Emotion Ontology (MFOEM)", 46315],
        ["Environment Ontology (ENVO)", 45418],
        ["Enzyme Mechanism Ontology (EMO)", 45950],
        ["Epilepsy (EpilepOnto)", 45987],
        ["Epoch Clinical Trial Ontologies (ClinicalTrialOntology)", 8056],
        ["Event (INOH pathway ontology) (IEV)", 45404],
        ["Evidence codes (ECO)", 46141],
        ["ExO (ExO)", 45220],
        ["Experimental Conditions Ontology (XCO)", 45507],
        ["Experimental Factor Ontology (EFO)", 46272],
        ["FDA Medical Devices (2010) (FDA-MedDevice)", 45231],
        ["Family Health History Ontology (FHHO)", 38631],
        ["Fly taxonomy (FBsp)", 45249],
        ["FlyBase Controlled Vocabulary (FBcv)", 46086],
        ["Foundational Model of Anatomy (FMA)", 44507],
        ["Fungal gross anatomy (FAO)", 45817],
        ["Galen (GALEN)", 4525],
        ["Gazetteer (GAZ)", 46106],
        ["Gene Ontology (GO)", 46349],
        ["Gene Ontology Extension (GO)", 45890],
        ["Gene Regulation Ontology (BOOTStrep)", 45127],
        ["Gene Regulation Ontology (GRO)", 44629],
        ["General Formal Ontology (GFO)", 42452],
        ["General Formal Ontology: Biology (GFO-Bio)", 42453],
        ["GeoSpecies Ontology (geospecies)", 39933],
        ["HCPCS (HCPCS)", 44454],
        ["HEALTH_INDICATORS (HLTH_INDICS)", 45294],
        ["HOM-DATASOURCE_EPIC (EPIC-SRC)", 46276],
        ["HOM-DATASOURCE_OSHPD (HOM-DATASOURCE_OSHPD)", 46190],
        ["HOM-DATASOURCE_OSHPDSC (SRC-OSHPDSC)", 46285],
        ["HOM-DXPROCS_MDCDRG (HOM-DXPROCS_MDCDRG)", 45992],
        ["HOM-DXVCODES2_OSHPD (HOM-DXVCODES2)", 46083],
        ["HOM-EPIC (HOM-EPIC)", 46195],
        ["HOM-HARVARD (HOM_HARVARD)", 45879],
        ["HOM-ICD9CM-ECODES (HOM-ICD9CM-ECODES)", 46068],
        ["HOM-ICD9CM_PROCEDURES (HOM-ICD9CM_PROCEDURES)", 45991],
        ["HOM-ICD9_DXandVCODES_OSHPD (HOM-DXandVCODES_OSHPD)", 46064],
        ["HOM-ICD9_PROCS_OSHPD (HOM-PROCS_OSHPD)", 46062],
        ["HOM-MDCDRG_OSHPD (HOM-MDCDRG_OSHPD)", 46066],
        ["HOM-OSHPD (HOM-OSHPD)", 46194],
        ["HOM-OSHPD-SC (HOM-OSHPD-SC)", 46286],
        ["HOM-OSHPD_UseCase (HOM-OSHPD_UseCase)", 46061],
        ["HOM-PROCS2_OSHPD (HOM-PROCS2)", 46080],
        ["HOM-Transplant Ontology (HOM-TX)", 46211],
        ["HOM-UCARE (HOM-UCARE)", 45880],
        ["HOMERUN Ontology (HOMERUN)", 45948],
        ["HOM_ElixhauserScores (HOM_EHS)", 45290],
        ["HOM_MDCs-DRGS (HOM_MDCs_DRGs)", 45966],
        ["HUGO (HUGO)", 45082],
        ["Habronattus courtship (HC)", 3036],
        ["Health Level Seven (HL7)", 42545],
        ["Hewan Invertebrata (invertebrata)", 46154],
        ["Host Pathogen Interactions Ontology (HPIO)", 45230],
        ["Human Phenotype Ontology (HP)", 46328],
        ["Human developmental anatomy, abstract version (EHDAA)", 45254],
        ["Human developmental anatomy, abstract version, v2 (EHDAA2)", 46268],
        ["Human developmental anatomy, timed version (EHDA)", 45262],
        ["Human disease (DOID)", 46309],
        ["Hymenoptera Anatomy Ontology (HAO)", 46299],
        ["ICD-10-PCS (ICD10PCS)", 46303],
        ["ICD10 (ICD10)", 44103],
        ["ICD10CM (ICD10CM)", 46302],
        ["ICD_Oncology-3 (ICDO3)", 46335],
        ["ICPC-2 PLUS (ICPC2P)", 42297],
        ["ICPS Network (ICPS)", 44304],
        ["IMGT-ONTOLOGY (IMGT)", 42685],
        ["Infectious Disease Ontology (IDO)", 46205],
        ["Influenza Ontology (FLU)", 42167],
        ["Information Artifact Ontology (IAO)", 40642],
        ["Interaction Network Ontology (INO)", 44354],
        ["International Classification for Nursing Practice (ICNP)", 45766],
        ["International Classification of  External Causes of Injuries (ICECI)", 42765],
        ["International Classification of Diseases (ICD-9)", 45221],
        ["International Classification of Functioning, Disability and Health (ICF) (ICF)", 45578],
        ["International Classification of Primary Care (ICPC)", 40393],
        ["IxnO (IxnO)", 45567],
        ["Kinetic Simulation Algorithm Ontology (KiSAO)", 46039],
        ["Leukocyte Surface Markers (LSM)", 45980],
        ["Lipid Ontology (LiPrO)", 44210],
        ["Loggerhead nesting (LHN)", 44831],
        ["Logical Observation Identifier Names and Codes (LNC)", 44774],
        ["MDSS Mo (MO)", 40649],
        ["MGED Ontology (MO)", 38801],
        ["MaHCO - An MHC Ontology (MHC)", 39804],
        ["Maize gross anatomy (ZEA)", 3294],
        ["Malaria Ontology (IDOMAL)", 44686],
        ["Mammalian phenotype (MP)", 46310],
        ["Mass spectrometry (MS)", 46339],
        ["Master Drug Data Base (MDDB)", 42284],
        ["MeGO (MeGO)", 39976],
        ["Measurement Method Ontology (MMO)", 45506],
        ["MedDRA (MDR)", 42280],
        ["Medaka fish anatomy and development (MFO)", 45796],
        ["Medical Subject Headings (MSH)", 44776],
        ["MedlinePlus Health Topics (MEDLINEPLUS)", 40397],
        ["Metathesaurus CPT Hierarchical Terms (MTHCH)", 42994],
        ["Minimal anatomical terminology (MAT)", 40245],
        ["Molecule role (INOH Protein name/family name ontology) (IMR)", 45784],
        ["Mosquito gross anatomy (TGMA)", 46273],
        ["Mosquito insecticide resistance (MIRO)", 46351],
        ["Mouse adult gross anatomy (MA)", 46004],
        ["Mouse gross anatomy and development (EMAP)", 45267],
        ["Mouse pathology (MPATH)", 45471],
        ["Multiple alignment (MAO)", 44944],
        ["NCBI organismal classification (NCBITaxon)", 38802],
        ["NCI Metathesaurus (NCIM)", 45339],
        ["NCI Thesaurus (NCIt)", 46317],
        ["NIF Cell (NIF_Cell)", 46322],
        ["NIF Dysfunction (NIF_Dysfunction)", 45807],
        ["NIFSTD (nif)", 45824],
        ["NMR-instrument specific component of metabolomics investigations (NMR)", 44836],
        ["NanoParticle Ontology (NPO)", 45233],
        ["National Drug Data File (NDDF)", 42282],
        ["National Drug File (NDFRT)", 40402],
        ["Neomark Oral Cancer-Centred Ontology (NeoMarkOntology)", 42835],
        ["Neural ElectroMagnetic Ontologies (NEMO)", 45981],
        ["Neural Motor Recovery Ontology (NeuMORE)", 44245],
        ["Neural-Immune Gene Ontology (NIGO)", 44724],
        ["Neuro Behavior Ontology (NBO)", 45834],
        ["Nursing Interventions Classification (NIC) (NIC)", 42296],
        ["OBO relationship types (OBO_REL)", 45681],
        ["OBOE (OBOE)", 44258],
        ["OBOE SBC (oboe-sbc)", 44257],
        ["Online Mendelian Inheritance in Man (OMIM)", 45553],
        ["Ontology for Biomedical Investigations (OBI)", 46089],
        ["Ontology for Drug Discovery Investigations (DDI)", 44704],
        ["Ontology for General Medical Science (OGMS)", 46293],
        ["Ontology for Genetic Interval (OGI)", 40117],
        ["Ontology for MicroRNA Target Prediction (OMIT)", 42998],
        ["Ontology for Parasite LifeCycle (OPL)", 45823],
        ["Ontology for disease genetic investigation (ODGI)", 39579],
        ["Ontology of Clinical Research (OCRe) (OCRe)", 45993],
        ["Ontology of Data Mining (OntoDM)", 45982],
        ["Ontology of General Purpose Datatypes (OntoDT)", 45330],
        ["Ontology of Geographical Region (OGR)", 39577],
        ["Ontology of Glucose Metabolism Disorder (OGMD)", 45532],
        ["Ontology of Language Disorder in Autism (LDA)", 40652],
        ["Ontology of Medically Related Social Entities (OMRSE)", 45307],
        ["Ontology of Physics for Biology (OPB)", 45601],
        ["Ontology of homology and related concepts in biology (HOM)", 42117],
        ["Orphanet Ontology of Rare Diseases (OntoOrpha)", 45845],
        ["PHARE (PHARE)", 45138],
        ["PKO_Re (PKO)", 40917],
        ["PMA 2010 (pma)", 44666],
        ["PRotein Ontology (PRO) (PR)", 46326],
        ["Parasite Experiment Ontology (PEO)", 45863],
        ["Pathogen transmission (TRANS)", 44947],
        ["Pathway ontology (PW)", 46237],
        ["Pediatric Terminology (PedTerm)", 45989],
        ["PharmGKB-in-OWL (pharmgkb-owl)", 46090],
        ["Pharmacovigilance Ontology (PVOnto)", 45146],
        ["PhenomeBLAST ontology (phenomeblast-owl)", 46091],
        ["Phenotypic quality (PATO)", 46331],
        ["Phylogenetic Ontology (PhylOnt)", 45588],
        ["PhysicalFields (Field)", 40483],
        ["Physician Data Query (PDQ)", 45074],
        ["Physico-chemical methods and properties (FIX)", 45720],
        ["Physico-chemical process (REX)", 45248],
        ["Pilot Ontology (POL)", 40653],
        ["Plant Anatomy (PO)", 45953],
        ["Plant Growth and Development Stage (PO)", 45902],
        ["Plant Ontology (PO)", 45782],
        ["Plant Trait Ontology (TO)", 46149],
        ["Plant environmental conditions (EO)", 45260],
        ["Platynereis stage ontology (PD_ST)", 44006],
        ["Protein Ontology (pro-ont)", 3905],
        ["Protein modification (MOD)", 42456],
        ["Protein-protein interaction (MI)", 39508],
        ["Proteomics Pipeline Infrastructure for CPTAC (CPTAC)", 40009],
        ["Proteomics data and process provenance (ProPreO)", 13386],
        ["Pseudogene (pseudo)", 38873],
        ["Quadrupedal Gait (CAMRQ)", 46147],
        ["Quantitative Imaging Biomarker Ontology (QIBO)", 46348],
        ["RNA ontology (RNAO)", 44005],
        ["RadLex (RID)", 45589],
        ["Rat Strain Ontology (RS)", 46079],
        ["Read Codes, Clinical Terms Version 3 (CTV3)  (RCD)", 42295],
        ["Reproductive traits ontology (REPO)", 44827],
        ["Role Ontology (RoleO)", 44694],
        ["RxNORM (RXNORM)", 44775],
        ["SNOMED Clinical Terms (SNOMEDCT)", 46116],
        ["SNP-Ontology (SNPO)", 39215],
        ["Sample processing and separation techniques (SEP)", 39509],
        ["SemanticScience Integrated Ontology (SIO)", 46175],
        ["Sequence types and features (SO)", 46343],
        ["Situation-Based Access Control (SitBAC)", 45298],
        ["Skin Physiology Ontology (SPO)", 38611],
        ["Sleep Domain Ontology (SDO)", 46054],
        ["Smoking Behavior Risk Ontology (SBRO)", 44448],
        ["Software Ontology (SWO)", 45810],
        ["Spatial Ontology (BSPO)", 46005],
        ["Spider Ontology (SPD)", 45274],
        ["Student Health Record (SHR)", 46314],
        ["Subcellular Anatomy Ontology (SAO) (SAO)", 14391],
        ["Suggested Ontology for Pharmacogenomics (SOPHARM)", 39343],
        ["Symptom Ontology (SYMP)", 45263],
        ["Syndromic Surveillance Ontology (SSO)", 40646],
        ["SysMO-JERM (JERM)", 46047],
        ["Systems Biology (SBO)", 45638],
        ["Systems Chemical Biology/Chemogenomics  (Chem2Bio2OWL)", 46232],
        ["TOK_Ontology (TOK)", 42834],
        ["Taxonomic rank vocabulary (TAXRANK)", 44946],
        ["Teleost Anatomy Ontology (TAO)", 46338],
        ["Teleost taxonomy (TTO)", 45258],
        ["Terminology for the Description of Dynamics (TEDDY)", 46199],
        ["Terminology of Anatomy of Human Embryology (TAHE)", 44572],
        ["Terminology of Anatomy of Human Histology (TAHH)", 44571],
        ["Tick gross anatomy (TADS)", 45242],
        ["Tissue Microarray Ontology (TMA)", 42764],
        ["Traditional Medicine Constitution Value Set (TM-CONST)", 45215],
        ["Traditional Medicine Meridian Value Sets (TM-MER)", 45218],
        ["Traditional Medicine Other Factors Value Set (TM-OTHER-FACTORS)", 45216],
        ["Traditional Medicine Signs and Symptoms Value Set (TM-SIGNS-AND-SYMPTS)", 45217],
        ["Translational Medicine Ontology (TMO)", 46121],
        ["Uber anatomy ontology (UBERON)", 46325],
        ["Units Ontology (UnitsOntology)", 46042],
        ["Units of measurement (UO)", 45830],
        ["VANDF (VANDF)", 44452],
        ["Vaccine Ontology (VO)", 46345],
        ["Vertebrate Anatomy Ontology (VAO)", 46347],
        ["Vertebrate Trait Ontology (VT)", 46334],
        ["WHO Adverse Reaction Terminology (WHO)", 40404],
        ["Web Service Interaction Ontology (WSIO)", 45903],
        ["Wheat trait  (CO_Wheat)", 44779],
        ["Xenopus anatomy and development (XAO)", 45264],
        ["Yeast phenotypes (YPO)", 46320],
        ["Zebrafish anatomy and development (ZFA)", 46009],
        ["apollo-akesios (apollo)", 44565],
        ["eVOC (Expressed Sequence Annotation for Humans) (EV)", 44302],
        ["linkingkin2pep (k2p)", 40802],
        ["vertebrate Homologous Organ Groups (vHOG)", 46269]
        ]
  end
  
  
  def get_ontology_list_from_bioportal
    desired_ontologies = [46321, 46085, 45968, 45890, 44507, 44777, 45589]
    @ontologies = []
    desired_ontologies.each do |id|
      ontology = @bioportal.get_ontology(id)
      if ontology.exists?
        @ontologies.push(ontology)
      end
    end
    all_ontologies = @bioportal.get_ontologies
    all_ontologies.sort {|a,b| a.label <=> b.label}.each do |o|
      if !desired_ontologies.include?(o.id)
        @ontologies.push(o)
      end
    end
    return [['',0]] + @ontologies.collect {|o| ["#{o.label} (#{o.abbreviation})", o.id]}
  end
  
  def switch_to_stage
    use_bioportal_stage
    puts "switch to stage"
    redirect_to "/bioportal"
  end
  
  def switch_to_production
    use_bioportal_production
    puts "switch to production"
    redirect_to "/bioportal"
  end
  
  def get_ontology
    if params[:oid]
      @ontology = @bioportal.get_ontology(params[:oid], true)
      if !@ontology.ontology_id.nil?
        @terms = @ontology.get_terms
      end
    end
    respond_to do |format|
      format.js { render :layout => false }
    end
  end
  
  def get_terms
    if params[:oid] and params[:tid]
      @ontology = @bioportal.get_ontology(params[:oid], false)
      @term = @ontology.get_term(params[:tid])
      @terms = @term.get_children
    end
    if params[:subid]
      @subid = params[:subid]
    end
    if params[:update]
      @update = params[:update]
    end
    if params[:did]
      @domain_id = params[:did]
    end
    if params[:pid]
      @property_id = params[:pid]
    end
    respond_to do |format|
      format.js { render :layout => false }
    end
  end
  
  def create_triple
    if params[:oid] and params[:tid] and params[:did] and params[:pid]
      # @ontology = @bioportal.get_ontology(params[:oid], false)
      # @term = @ontology.get_term(params[:tid])
      # @domain = @ontology.get_term(params[:did])
      ontology_id = params[:oid]
      domain_id = params[:did]
      range_id = params[:tid]
      property_id = params[:pid]
      # Now we need to get the ontology and related terms, this will need some major cleaning up, but just very rough for now
      @bpontology = BpOntology.first(:conditions => {:versionid => ontology_id})
      if @bpontology.nil?
        @ontology = @bioportal.get_ontology(ontology_id)
        @bpontology = BpOntology.create(
            :versionid => @ontology.id, 
            :ontologyid => @ontology.ontology_id,
            :name => @ontology.label,
            :description => @ontology.description,
            :abbreviation => @ontology.abbreviation
            )
        @bpontology.save
      else
        @ontology = @bioportal.get_ontology(ontology_id, false)
      end
      @bpdomain = BpTerm.first(:conditions => {:bp_ontology_id => @bpontology.id, :bpid => domain_id})
      if @bpdomain.nil?
        @term_domain = @ontology.get_term(domain_id)
        @bpdomain = BpTerm.create(
          :bpid => domain_id,
          :bp_ontology => @bpontology,
          :name => @term_domain.label
          )
        @bpdomain.save
      end
      @bprange = BpTerm.first(:conditions => {:bp_ontology_id => @bpontology.id, :bpid => range_id})
      if @bprange.nil?
        @term_range = @ontology.get_term(range_id)
        @bprange = BpTerm.create(
          :bpid => range_id,
          :bp_ontology => @bpontology,
          :name => @term_range.label
          )
        @bprange.save
      end
      # Now we create the triple unless it already exists
      @triple = BpTriple.first(:conditions => {:domain => @bpdomain.id, :property => property_id, :range => @bprange.id})
      if @triple.nil?
        @triple = BpTriple.new(
          :domain => @bpdomain, :property => property_id, :range => @bprange
          )
        @triple.save
      end
    end
    respond_to do |format|
      format.js { render :layout => false }
    end
 end
  
  def delete_triple
    if params[:oid] and params[:tripleid]
      @ontology = @bioportal.get_ontology(params[:oid], false)
      triple = BpTriple.find(params[:tripleid])
      if triple
        triple.destroy
      end
    end
    respond_to do |format|
      format.js { render :layout => false }
    end
 end
  
  def get_term_details
    if params[:oid] and params[:tid]
      @ontology = @bioportal.get_ontology(params[:oid], false)
      @term = @ontology.get_term(params[:tid])
    end
    if params[:update]
      @update = params[:update]
    end
    respond_to do |format|
      format.js { render :layout => false }
    end
  end
  
  def use_staging_server
    @bioportal.base_url = "http://stagerest.bioontology.org/bioportal"
    redirect_to "/bioportal"
  end
end
