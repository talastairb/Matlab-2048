%{
Matlab 2048
Theodore Bastian (tab111)
Cole Williams (cxw439)
ENGR131
%}

%some required elements are commented!
%at least one of each type is marked
%search for the word requirement to see them

function matlab2048(varargin)

f = figure('Position', [0 0 400 500], 'Visible', 'off', 'MenuBar', 'none', 'Name', '2048', 'Color', [.9 .9 .9], 'ToolBar', 'none'); %gui requirement

movegui(f, 'center')

startNums=2;%how many numbers to start with

score=0; %possibly implemented in future versions
%the move algorithm is partly flawed for moving down and right.  it should be fixed at some point
%also the game throws errors trying to update when the gameover method is called and keys are pressed

static11 = uicontrol('Style', 'text', 'Position', [000 400 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center'); %these create where the numbers go
static12 = uicontrol('Style', 'text', 'Position', [100 400 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center'); %http://www.mathworks.com/help/matlab/ref/uicontrol-properties.html
static13 = uicontrol('Style', 'text', 'Position', [200 400 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static14 = uicontrol('Style', 'text', 'Position', [300 400 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static21 = uicontrol('Style', 'text', 'Position', [000 300 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static22 = uicontrol('Style', 'text', 'Position', [100 300 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static23 = uicontrol('Style', 'text', 'Position', [200 300 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static24 = uicontrol('Style', 'text', 'Position', [300 300 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static31 = uicontrol('Style', 'text', 'Position', [000 200 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static32 = uicontrol('Style', 'text', 'Position', [100 200 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static33 = uicontrol('Style', 'text', 'Position', [200 200 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static34 = uicontrol('Style', 'text', 'Position', [300 200 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static41 = uicontrol('Style', 'text', 'Position', [000 100 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static42 = uicontrol('Style', 'text', 'Position', [100 100 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static43 = uicontrol('Style', 'text', 'Position', [200 100 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');
static44 = uicontrol('Style', 'text', 'Position', [300 100 100 100], 'String', '', 'FontSize', 36, 'BackgroundColor', 'w', 'HorizontalAlignment', 'center');

static = uicontrol('Style', 'text', 'Position', [50 50 300 50], 'String', 'WASD to move, Q to quit, N for new game', 'FontSize', 14, 'BackgroundColor', [.9 .9 .9]);

button1 = uicontrol('Style', 'pushbutton', 'String', 'Save', 'Position',[75 000 100 050], 'Callback', @save);
button2 = uicontrol('Style', 'pushbutton', 'String', 'Load', 'Position',[225 000 100 050], 'Callback', @load);

set(f,'KeyPressFcn',@keyDownListener) %enables keylistener

set(f, 'Visible', 'on') % We kept the window invisible until now to avoid displaying an unfinished version

if nargin==0%new game
    board=[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]; %represents the value in each board position
    for i = 1:startNums
        random(board) %how many numbers to spawn
    end
else
    board=varargin{1};%start from a specific board layout
    update(board);
end

    function update(array) %refreshes the board and adds colors. fulfills the function requirement
        board=array;
        
        count=0;
        
        celery=cell(1,2); %cell array requirement
        
        if board(1,1) == 0
            set(static11, 'String', '', 'BackgroundColor', 'w')
            count =count+1;
            celery{count,1}=1;
            celery{count,2}=1;
        else
            set(static11, 'String', num2str(board(1,1)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(1,1)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static11, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(1,2) == 0
            set(static12, 'String', '', 'BackgroundColor', 'w')
            count =count+1;
            celery{count,1}=1;
            celery{count,2}=2;
        else
            set(static12, 'String', num2str(board(1,2)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(1,2)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static12, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(1,3) == 0
            set(static13, 'String', '', 'BackgroundColor', 'w')
            count =count+1;
            celery{count,1}=1;
            celery{count,2}=3;
        else
            set(static13, 'String', num2str(board(1,3)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(1,3)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static13, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(1,4) == 0
            set(static14, 'String', '', 'BackgroundColor', 'w')
            count =count+1;
            celery{count,1}=1;
            celery{count,2}=4;
        else
            set(static14, 'String', num2str(board(1,4)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(1,4)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static14, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(2,1) == 0
            set(static21, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=2;
            celery{count,2}=1;
        else
            set(static21, 'String', num2str(board(2,1)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(2,1)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static21, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(2,2) == 0
            set(static22, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=2;
            celery{count,2}=2;
        else
            set(static22, 'String', num2str(board(2,2)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(2,2)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static22, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(2,3) == 0
            set(static23, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=2;
            celery{count,2}=3;
        else
            set(static23, 'String', num2str(board(2,3)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(2,3)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static23, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(2,4) == 0
            set(static24, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=2;
            celery{count,2}=4;
        else
            set(static24, 'String', num2str(board(2,4)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(2,4)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static24, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(3,1) == 0
            set(static31, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=3;
            celery{count,2}=1;
        else
            set(static31, 'String', num2str(board(3,1)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(3,1)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static31, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(3,2) == 0
            set(static32, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=3;
            celery{count,2}=2;
        else
            set(static32, 'String', num2str(board(3,2)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(3,2)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static32, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(3,3) == 0
            set(static33, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=3;
            celery{count,2}=3;
        else
            set(static33, 'String', num2str(board(3,3)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(3,3)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static33, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(3,4) == 0
            set(static34, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=3;
            celery{count,2}=4;
        else
            set(static34, 'String', num2str(board(3,4)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(3,4)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static34, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(4,1) == 0
            set(static41, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=4;
            celery{count,2}=1;
        else
            set(static41, 'String', num2str(board(4,1)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(4,1)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static41, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(4,2) == 0
            set(static42, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=4;
            celery{count,2}=2;
        else
            set(static42, 'String', num2str(board(4,2)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(4,2)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static42, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(4,3) == 0
            set(static43, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=4;
            celery{count,2}=3;
        else
            set(static43, 'String', num2str(board(4,3)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(4,3)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static43, 'BackgroundColor', colorArray)
            %end color stuff
        end
        
        if board(4,4) == 0
            set(static44, 'String', '', 'BackgroundColor', 'w')
            count = count+1;
            celery{count,1}=4;
            celery{count,2}=4;
        else
            set(static44, 'String', num2str(board(4,4)))
            %start color stuff
            colorArray = [0 0 0];%black
            switch board(4,4)
                case 2
                    colorArray = [.9 .9 .7];%tan
                case 4
                    colorArray = [.9 .9 .5];
                case 8
                    colorArray = [.9 .7 .5];%coral
                case 16
                    colorArray = [.9 .5 .5];
                case 32
                    colorArray = [.9 .3 .3];
                case 64
                    colorArray = [.9 .1 .1];%red
                case 128
                    colorArray = [.9 .3 .1];
                case 256
                    colorArray = [.7 .5 .3];
                case 512
                    colorArray = [.7 .7 .3];%tan
                case 1024
                    colorArray = [.9 .9 .1];
                case 2048
                    colorArray = [1 1 0];%yellow
                case 4096
                    colorArray = [1 .4 .6];
                case 8192
                    colorArray = [1 .2 .8];
                case 16384
                    colorArray = [1 0 1];%magenta
                otherwise
                    colorArray = [1 1 1];%white
            end
            set(static44, 'BackgroundColor', colorArray)
            %end color stuff
            
        if count == 0 %if passed a full board
            %close;
            gameOverMenu(); %game over logic
        end
        end
    end

    function random(array) %adds a random number then refreshes the board (via the update method).  also fulfills the function requirement
        
        old=board;
        board=array;
        
        count=0;
        
        celery=cell(1,2); %cell array requirement
        
        if board(1,1) == 0
            set(static11, 'String', '')
            count = count+1;
            celery{count,1}=1;
            celery{count,2}=1;
        else
            set(static11, 'String', num2str(board(1,1)))
        end
        
        if board(1,2) == 0
            set(static12, 'String', '')
            count = count+1;
            celery{count,1}=1;
            celery{count,2}=2;
        else
            set(static12, 'String', num2str(board(1,2)))
        end
        
        if board(1,3) == 0
            set(static13, 'String', '')
            count = count+1;
            celery{count,1}=1;
            celery{count,2}=3;
        else
            set(static13, 'String', num2str(board(1,3)))
        end
        
        if board(1,4) == 0
            set(static14, 'String', '')
            count = count+1;
            celery{count,1}=1;
            celery{count,2}=4;
        else
            set(static14, 'String', num2str(board(1,4)))
        end
        
        if board(2,1) == 0
            set(static21, 'String', '')
            count = count+1;
            celery{count,1}=2;
            celery{count,2}=1;
        else
            set(static21, 'String', num2str(board(2,1)))
        end
        
        if board(2,2) == 0
            set(static22, 'String', '')
            count = count+1;
            celery{count,1}=2;
            celery{count,2}=2;
        else
            set(static22, 'String', num2str(board(2,2)))
        end
        
        if board(2,3) == 0
            set(static23, 'String', '')
            count = count+1;
            celery{count,1}=2;
            celery{count,2}=3;
        else
            set(static23, 'String', num2str(board(2,3)))
        end
        
        if board(2,4) == 0
            set(static24, 'String', '')
            count = count+1;
            celery{count,1}=2;
            celery{count,2}=4;
        else
            set(static24, 'String', num2str(board(2,4)))
        end
        
        if board(3,1) == 0
            set(static31, 'String', '')
            count = count+1;
            celery{count,1}=3;
            celery{count,2}=1;
        else
            set(static31, 'String', num2str(board(3,1)))
        end
        
        if board(3,2) == 0
            set(static32, 'String', '')
            count = count+1;
            celery{count,1}=3;
            celery{count,2}=2;
        else
            set(static32, 'String', num2str(board(3,2)))
        end
        
        if board(3,3) == 0
            set(static33, 'String', '')
            count = count+1;
            celery{count,1}=3;
            celery{count,2}=3;
        else
            set(static33, 'String', num2str(board(3,3)))
        end
        
        if board(3,4) == 0
            set(static34, 'String', '')
            count = count+1;
            celery{count,1}=3;
            celery{count,2}=4;
        else
            set(static34, 'String', num2str(board(3,4)))
        end
        
        if board(4,1) == 0
            set(static41, 'String', '')
            count = count+1;
            celery{count,1}=4;
            celery{count,2}=1;
        else
            set(static41, 'String', num2str(board(4,1)))
        end
        
        if board(4,2) == 0
            set(static42, 'String', '')
            count = count+1;
            celery{count,1}=4;
            celery{count,2}=2;
        else
            set(static42, 'String', num2str(board(4,2)))
        end
        
        if board(4,3) == 0
            set(static43, 'String', '')
            count = count+1;
            celery{count,1}=4;
            celery{count,2}=3;
        else
            set(static43, 'String', num2str(board(4,3)))
        end
        
        if board(4,4) == 0
            set(static44, 'String', '')
            count = count+1;
            celery{count,1}=4;
            celery{count,2}=4;
        else
            set(static44, 'String', num2str(board(4,4)))
        end
        
        if count >0 %adds a random number if the board is not filled
            x=randi(count);%random unfilled board position
            
            switch randi(3) % options for a spawn
                case 1
                    board(celery{x,1},celery{x,2})=4;
                case 2
                    board(celery{x,1},celery{x,2})=2;
                case 3
                    board(celery{x,1},celery{x,2})=2;
                case 4
                    board(celery{x,1},celery{x,2})=0;%no spawn-disabled
            end
        end
        
        if count == 0 %if passed a full board
            %close;
            gameOverMenu(); %game over logic
        end
        
        update(board);
    end

    function keyDownListener(source,eventdata) %this deals with movement
        
        array=[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
        
        switch eventdata.Key
            case 'w'
                for c=1:4 %loop requirement
                    count=0;
                    celery=cell(1);
                    for r=1:4 %figures out how many blocks are filled per column
                        if board(r,c)~=0
                            count=count+1;
                            celery{count}=board(r,c);
                        end
                    end
                    if count>1 %if there is stuff that could merge
                        %{
                        for i=2:count %merges same blocks
                            if celery{i-1} == celery{i}%this needs to be fixed--DEBUG
                                celery{i-1}=2*celery{i-1};%one merged block is doubled but the other needs to be removed
                            end
                        end
                        %}
                        i=2; %block merge attempted fix
                        count2=count;
                        while i <= count2 %merges same blocks
                            if celery{i-1} == celery{i}%this is the fix for the commented out code above
                                celery{i-1}=2*celery{i-1};%one merged block is doubled but the other needs to be removed
                                celery(i)=[]; %remove the block from the cell array
                                count2=count2-1;%subtract one from the length of count2
                                i=i+1;%skip the next block
                            end
                            i=i+1;%add one to i
                        end
                    end
                    if count>0 %if there is stuff that could move
                        for j=1:length(celery) %puts updated blockchain in new array
                            array(j,c)=celery{j};
                        end
                    end
                end
                if isequal(board, array) ==0 %if the original board and the new array arent the same, something has changed
                    random(array);
                else
                    update(array); %for calling game over method if the game is over
                end
                
            case 'a'
                for r=1:4 %loop requirement
                    count=0;
                    celery=cell(1);
                    for c=1:4 %figures out how many blocks are filled per column
                        if board(r,c)~=0
                            count=count+1;
                            celery{count}=board(r,c);
                        end
                    end
                    if count>1 %if there is stuff that could merge
                        i=2; %block merge attempted fix
                        count2=count;
                        while i <= count2 %merges same blocks
                            if celery{i-1} == celery{i}
                                celery{i-1}=2*celery{i-1};%one merged block is doubled but the other needs to be removed
                                celery(i)=[]; %remove the block from the cell array
                                count2=count2-1;%subtract one from the length of count2
                                i=i+1;%skip the next block
                            end
                            i=i+1;%add one to i
                        end
                    end
                    if count>0 %if there is stuff that could move
                        for j=1:length(celery) %puts updated blockchain in new array
                            array(r,j)=celery{j};
                        end
                    end
                end
                if isequal(board, array) ==0 %if the original board and the new array arent the same, something has changed
                    random(array);
                else
                    update(array); %for calling game over method if the game is over
                end
                
            case 's'
                for c=1:4 %loop requirement
                    count=0;
                    celery=cell(1);
                    for r=1:4 %figures out how many blocks are filled per column
                        if board(r,c)~=0
                            count=count+1;
                            celery{count}=board(r,c);
                        end
                    end
                    celery2=fliplr(celery);%switch order of celery2
                    if count>1 %if there is stuff that could merge
                        %{
                        for i=2:count %merges same blocks
                            if celery2{i-1} == celery2{i}
                                celery2{i-1}=2*celery2{i-1};
                                %celery2{i}=[];
                            end
                        end
                        %}
                        %
                        i=2; %block merge attempted fix
                        count2=count;
                        while i <= count2 %merges same blocks
                            if celery2{i-1} == celery2{i};%this needs to be fixed--DEBUG
                                celery2{i-1}=2*celery2{i-1};%one merged block is doubled but the other needs to be removed
                                celery2(i)=[]; %remove the block from the cell array
                                count2=count2-1;%subtract one from the length of count2
                                i=i+1;%skip the next block
                            end
                            i=i+1;%add one to i
                        end
                        %
                    end
                    if count>0 %if there is stuff that could move
                        for j=1:length(celery2) %puts updated blockchain in new array
                            array((5-j),c)=celery2{j};
                        end
                    end
                end
                if isequal(board, array) ==0 %if the original board and the new array arent the same, something has changed
                    random(array);
                else
                    update(array); %for calling game over method if the game is over
                end
                
            case 'd'
                for r=1:4 %loop requirement
                    count=0;
                    celery=cell(1);
                    for c=1:4 %figures out how many blocks are filled per column
                        if board(r,c)~=0
                            count=count+1;
                            celery{count}=board(r,c);
                        end
                    end
                    celery2=fliplr(celery);
                    if count>1 %if there is stuff that could merge
                        %{
                        for i=2:count %merges same blocks
                            if celery2{i-1} == celery2{i}
                                celery2{i-1}=2*celery2{i-1};
                            end
                        end
                        %}
                        %
                        i=2; %block merge attempted fix
                        count2=count;
                        while i <= count2 %merges same blocks
                            if celery2{i-1} == celery2{i};%this needs to be fixed--DEBUG
                                celery2{i-1}=2*celery2{i-1};%one merged block is doubled but the other needs to be removed
                                celery2(i)=[]; %remove the block from the cell array
                                count2=count2-1;%subtract one from the length of count2
                                i=i+1;%skip the next block
                            end
                            i=i+1;%add one to i
                        end
                        %
                    end
                    if count>0 %if therse is stuff that could move
                        for j=1:length(celery2) %puts updated blockchain in new array
                            array(r,(5-j))=celery2{j};
                        end
                    end
                end
                if isequal(board, array) ==0 %if the original board and the new array arent the same, something has changed
                    random(array);
                else
                    update(array); %for calling game over method if the game is over
                end
                
                
            case 'q' %quit
                close;
                
            case 'n' %new game
                close;
                matlab2048()
                
        end
        
    end

% Callback functions for buttons
    function save(source,eventdata) %data write requirement
        fid = fopen('save.txt','w');
        if fid>2
            for r = 1:4
                for c = 1:4
                    fprintf(fid,'%d\n', board(r,c));
                end
            end
        end
        fclose(fid);
        set(f,'KeyPressFcn',@keyDownListener)
        close; %super sketch method of making this work
        matlab2048(board); % basically closes the gui and reopens it with the new board
    end

    function load(source,eventdata) %data read requirement
        fid = fopen('save.txt','r');
        if fid>2
            a = textscan(fid,'%d');
            count=1;
            for r = 1:4
                for c = 1:4
                    board(r,c)=a{1}(count);
                    count=count+1;
                end
            end
        end
        fclose('all');
        close; %super sketch method of making this work
        matlab2048(board); % basically closes the gui and reopens it with the new board
    end

    function gameOverMenu(varargin)
        f = figure('Position', [0 0 300 300], 'Visible', 'off');
        movegui(f, 'center');
        text1 = uicontrol('Style', 'text', 'Position', [0 200 300 100], 'String', 'GAME OVER!!!');
        button1 = uicontrol('Style', 'pushbutton', 'String', 'QUIT', 'Callback', @callbackfn1, 'Position', [20 50 100 50]);
        button2 = uicontrol('Style', 'pushbutton', 'String', 'TRY AGAIN', 'Callback', @callbackfn2, 'Position', [180 50 100 50]);
        set(f, 'Visible', 'on')
        
        function callbackfn1(source, eventdata)
            close all
        end
        
        function callbackfn2(source, eventdata)
            close all
            matlab2048()
        end
    end %gameovermenu

end