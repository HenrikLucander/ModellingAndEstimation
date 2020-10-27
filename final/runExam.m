
load modeldata.mat
prompt = 'Please Enter the numeric part of your student number!:  ';
studentNo = input(prompt);
k = find(modeldata.studentList == studentNo);
u1 = modeldata.u{k,1}; 
y1 = modeldata.y{k,1};
u2 = modeldata.u{k,2}; 
y2 = modeldata.y{k,2};
u3 = modeldata.u{k,3}; 
y3 = modeldata.y{k,3};
clear modeldata prompt studentNo k