% q d a alpha
% Inertia matrix formula:
% I = mass/12 * [(lz)^2+(ly)^2 0 0; 0 (lz)^2+(lx)^2 0; 0 0 (lx)^2+(ly)^2]
% Link lengths
LINK_LENGTH_ONE = 0.352;
RADIUS_ONE = 0.070;
LINK_LENGTH_TWO = 0.360;
LINK_LENGTH_THREE = 0.445;

% Join masses.
MASS_ONE = 2*50;
MASS_TWO = 2*30;
MASS_THREE = 2*35;

% First joint
j(1) = Link([0 LINK_LENGTH_ONE RADIUS_ONE pi/2]);

% Link mass
j(1).m = MASS_ONE;
% Centre of mass position
j(1).r = [0 0 0.352/2];
% Inertia matrix
j(1).I = m1/12*[(0.300)^2+(0.300)^2 0 0; 0 (0.300)^2+(0.352)^2 0; 0 0 (0.300)^2+(0.352)^2 ];
% Motor inertia
j(1).Jm = 0;
% Motor Friction
j(1).B = 0;
% Coulomb Friction
j(1).Tc = [ 0	0];
% Gear Ratio
j(1).G = 0.01;

% Second joint
j(2) = Link([0 0 LINK_LENGTH_TWO 0]);
% Link mass
j(2).m = MASS_TWO;
% Centre of mass position
j(2).r = [0.360/2 0 0];
% Inertia matrix
j(2).I = m2/12*[(0.100)^2+(0.100)^2 0 0; 0 (0.360)^2+(0.100)^2 0; 0 0 (0.360)^2+(0.100)^2];
% Motor inertia
j(2).Jm = 0;
% Motor Friction
j(2).B = 0;
% Coulomb Friction
j(2).Tc = [ 0	0];
% Gear Ratio
j(2).G = 0.01;

% Third joint
j(3) = Link([0 0 LINK_LENGTH_THREE 0]);
% Link mass
j(3).m = MASS_THREE;
% Centre of mass position
j(3).r = [0.445/2 0 0];
% Inertia matrix
j(3).I = m3/12*[(0.100)^2+(0.100)^2 0 0; 0 (0.360)^2+(0.100)^2 0; 0 0 (0.360)^2+(0.100)^2 ];
% Motor inertia
j(3).Jm = 0;
% Motor Friction
j(3).B = 0;
% Coulomb Friction
j(3).Tc = [ 0	0];
% Gear Ratio
j(3).G = 0.01;

% Connecting three links into a robot
robot = SerialLink(j, 'name', 'Bender');

% Initial position
q_initial = [0 0 0];

% Plot the initial position
robot.plot(q_initial);

% ========== Problem 2.1 Part B =========
% Finding the torque needed to maintain position
% against gravity
q_position = [0 10*pi/180 40*pi/180];
robot.rne(q_position, [0 0 0], [0 0 0], [0 0 9.81])

% Or alternatively, we can use the gravload method.
% Which will give us the same result
robot.gravload([0 10*pi/180 40*pi/180])

% ========== Problem 2.1 Part C =========
% Initial position
q_initial = [10*pi/180 20*pi/180 30*pi/180];

% Final position
q_final = [-10*pi/180 40*pi/180 10*pi/180];

% Initial and Final velocities
v_initial = [0 0 0];
v_final = [0 0 0];

% Time vector
time = [0:0.1:3];

% Maps trajectory from initial to final position
% From a stop to a stop (0 velocity to 0 velocity)
trajectory = jtraj(q_initial, q_final, time, v_initial, v_final);

% Plot this trajectory
robot.plot(trajectory);
