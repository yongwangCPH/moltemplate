
# Create the coordinates of the atoms using PACKMOL
cd packmol_files

  packmol < mix_ethylene+benzene.inp
  mv -f system.xyz ../moltemplate_files/

cd ..



# Create LAMMPS input files this way:
cd moltemplate_files

  # run moltemplate

  moltemplate.sh -xyz system.xyz system.lt

  # Optional:
  # To check for missing angle,dihedral params run moltemplate this way instead:
  # moltemplate.sh -xyz system.xyz -checkff system.lt 

  # This will generate various files with names ending in *.in* and *.data.
  # Move them to the directory where you plan to run LAMMPS (in this case "../")
  mv -f system.data system.in* ../

  # Optional: Move the "log.cite" file (containing links to relevant papers).
  mv -f log.cite* ../

  # Optional:
  # The "./output_ttree/" directory is full of temporary files generated by
  # moltemplate.  They can be useful for debugging, but are usually thrown away.
  rm -rf output_ttree/

cd ../




# Optional:
# Note: The system.data and system.in.settings files contain extra information
# for atoms defined in OPLSAA which you are not using in this simulation.
# This is harmless, but if you to delete this information from your
# system.in.settings and system.in.data files, run this script:
#
# cleanup_moltemplate.sh
