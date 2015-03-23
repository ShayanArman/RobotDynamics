% q d a alpha
% Link lengths
LINK_LENGTH_ONE = 0.352;
RADIUS_ONE = 0.070;
LINK_LENGTH_TWO = 0.360;
LINK_LENGTH_THREE = 0.445;

% Join masses
MASS_ONE = 50;
MASS_TWO = 30;
MASS_THREE = 35;

% First joint
j(1) = Link([0 LINK_LENGTH_ONE RADIUS_ONE pi/2]);

% Second joint
j(2) = Link([0 0 LINK_LENGTH_TWO 0]);

% Third joint
j(3) = Link([0 0 LINK_LENGTH_THREE 0]);

% Connecting three links into a robot
robot = SerialLink(j, 'name', 'Bender');

% Initial position
q_initial = [0 0 0];

% Plot the initial position
robot.plot(q_initial);