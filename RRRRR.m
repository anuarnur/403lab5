clear L

L(1) = Revolute('d', 0, 'a', 0.71, 'alpha', 0, ...  
    'I', [2, 2, 2, 0, 0, 0], ...
    'm', 1.01, ...
    'qlim', [-2 2]);
%    'Jm', 1e-4, ...
%     'G', 500, ...
%     'B', 10e-4, ...

    
L(2) = Revolute('d', 0, 'a', 0.71, 'alpha', 0, ...  
    'I', [2, 2, 2, 0, 0, 0], ...    
    'm', 1.01, ...
    'qlim', [-2 2]);

L(3) = Revolute('d', 0, 'a', 0.71, 'alpha', 0, ...   
    'I', [2, 2, 2, 0, 0, 0], ...   
    'm', 1.01, ...
    'qlim', [-2 2]);

L(4) = Revolute('d', 0, 'a', 0.71, 'alpha', 0, ...  
    'I', [2, 2, 2, 0, 0, 0], ...    
    'm', 1.01, ...
    'qlim', [-2 2]);

L(5) = Revolute('d', 0, 'a', 0.71, 'alpha', 0, ...    
    'I', [2, 2, 2, 0, 0, 0], ...  
    'm', 1.01, ...
    'qlim', [-2 2]);

robot = SerialLink(L, 'name', 'RRRRR manipulator');

q = [0 0 0 0 0];
robot.plot(q)
robot.teach()

q1 = [0 pi/2 0 0 0];
robot.payload(1,[0 0 0]);
torque=robot.gravload(q1)

j0=robot.jacob0(q1);
torque_th=transpose(j0)*[0; 0; 9.8;0;0;0]

torque2=robot.gravload(q)

j02=robot.jacob0(q);
torque_th2=transpose(j02)*[0; 0; 9.8;0;0;0]
