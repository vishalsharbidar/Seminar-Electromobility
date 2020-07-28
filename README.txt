Energy management in Hybrid vehicles with Matlab/Simulink

Document Submission
- Please find the report and presentation in the folder "Report and Presentation"
- Please find the report under the title <Report_Mukunda_Sachdeva_Permunda>, submitted in .pdf format.
- Please find the Presentation under the title <Presentation_Mukunda_Sachdeva_Permunda>, submitted in .pptx format.
- Please find the code files "new_controller", "startStop.m", "qss_hybrid_electric_vehicle_optimisation.mdl" and "qss_conventional_vehicle.mdl" in the folder QSS_TB_Seminar 

To run the simulation:
- Keep the files "new_controller.m", "startStop.m", "qss_hybrid_electric_vehicle_optimisation.mdl" and "qss_conventional_vehicle.mdl" in the same folder 
  and keep this folder in "QSS_TB_Seminar" folder.
- Right-click on QSS_TB_Seminar in MATLAB and select "Add to path ?" and then "Selected folders and subfolders".
- Fuel efficiency of the conventional vehicle can be checked using <qss_conventional_vehicle.mdl> model.

Files and functionality:
1. qss_hybrid_electric_vehicle_optimisation.mdl	: Simulink model which simulates the energy management system.
2. startStop.m					: File which implements the start-stop functionality of the simulation.
3. new_controller.m				: File which implements the conroller logic of the simulation.
4. qss_conventional_vehicle.mdl			: Simulink model which simulates the conventional vehicle.

File Interdependencies:
1. qss_hybrid_electric_vehicle_optimisation.mdl -> startStop.m
2. qss_hybrid_electric_vehicle_optimisation.mdl -> new_controller.m

Authors:
1. Vishal Sharbidar Mukunda (mukunda@rhrk.uni-kl.de)
2. Udai Sachdeva (sachdeva@rhrk.uni-kl.de)
3. Akshay Permunda (permunda@rhrk.uni-kl.de)
