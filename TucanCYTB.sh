# Para descargar las especies de Andigena con CYTB

/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "cytb [GENE] AND Andigena [ORGN]" | efetch -format fasta > CYTB-Andigena.fasta

# Para descrgar las especies de Capito con CYTB
/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "cytb [GENE] AND Capito [ORGN]" | efetch -format fasta > CYTB-Capito.fasta

# Para unir ambos archivos
cat CYTB-Andigena.fasta CYTB-Capito.fasta > CYTB-Tucanes.fasta

# Para alinear los archivos
./muscle3.8.31_i86linux64 -in CYTB-Tucanes.fasta -out CYTB-Tucanesaln.fasta

#PasoIntermedio=Cambiar los nombres en ATOM

REGULAR EXPRESSION: \>(\S+)\s+([A-Z][a-z]+)\s+([a-z]+).*

# Para cargar IQTREE
module load iqtree/2.2.2.6

# Comando para ejecturas IQTREE
iqtree -s CYTB-Tucanesaln.fasta -o JX045862.1_Capito_fitzpatricki -m GTR+I+G -bb 1000 -minsup 0.5 -redo


