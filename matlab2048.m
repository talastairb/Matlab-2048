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

f = figure('Position', [0 0 400 500], 'Visible', 'off', 'MenuBar', 'none', 'Name', '2048'); %gui requirement

movegui(f, 'center')

score=0; %possibly implemented in future versions
%gameover option will be added too
%also, the move algorithm is flawed

static11 = uicontrol('Style', 'text', 'Position', [000 400 100 100], 'String', ''); %these create where the numbers go
static12 = uicontrol('Style', 'text', 'Position', [100 400 100 100], 'String', '');
static13 = uicontrol('Style', 'text', 'Position', [200 400 100 100], 'String', '');
static14 = uicontrol('Style', 'text', 'Position', [300 400 100 100], 'String', '');
static21 = uicontrol('Style', 'text', 'Position', [000 300 100 100], 'String', '');
static22 = uicontrol('Style', 'text', 'Position', [100 300 100 100], 'String', '');
static23 = uicontrol('Style', 'text', 'Position', [200 300 100 100], 'String', '');
static24 = uicontrol('Style', 'text', 'Position', [300 300 100 100], 'String', '');
static31 = uicontrol('Style', 'text', 'Position', [000 200 100 100], 'String', '');
static32 = uicontrol('Style', 'text', 'Position', [100 200 100 100], 'String', '');
static33 = uicontrol('Style', 'text', 'Position', [200 200 100 100], 'String', '');
static34 = uicontrol('Style', 'text', 'Position', [300 200 100 100], 'String', '');
static41 = uicontrol('Style', 'text', 'Position', [000 100 100 100], 'String', '');
static42 = uicontrol('Style', 'text', 'Position', [100 100 100 100], 'String', '');
static43 = uicontrol('Style', 'text', 'Position', [200 100 100 100], 'String', '');
static44 = uicontrol('Style', 'text', 'Position', [300 100 100 100], 'String', '');

button1 = uicontrol('Style', 'pushbutton', 'String', 'Save', 'Position',[000 000 100 050], 'Callback', @save);
button2 = uicontrol('Style', 'pushbutton', 'String', 'Load', 'Position',[100 000 100 050], 'Callback', @load);

set(f,'KeyPressFcn',@keyDownListener)

set(f, 'Visible', 'on') % We kept the window invisible until now to avoid displaying an unfinished version

if nargin==0
    board=[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]; %represents the value in each board position
    random(board);
else
    board=varargin{1};
    update(board);
end

    function update(array) %refreshes the board. fulfills the function requirement
        board=array;
        
        count=0;
        
        celery=cell(1,2); %cell array requirement
        
        if board(1,1) == 0
            set(static11, 'String', '')
            count =count+1;
            celery{count,1}=1;
            celery{count,2}=1;
        else
            set(static11, 'String', num2str(board(1,1)))
        end
        
        if board(1,2) == 0
            set(static12, 'String', '')
            count =count+1;
            celery{count,1}=1;
            celery{count,2}=2;
        else
            set(static12, 'String', num2str(board(1,2)))
        end
        
        if board(1,3) == 0
            set(static13, 'String', '')
            count =count+1;
            celery{count,1}=1;
            celery{count,2}=3;
        else
            set(static13, 'String', num2str(board(1,3)))
        end
        
        if board(1,4) == 0
            set(static14, 'String', '')
            count =count+1;
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
    end

    function random(array) %adds a random number then refreshes the board.  also fulfills the function requirement
        
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
            x=randi(count);
            
            if randi(3)==1 %will be displayed next turn
                board(celery{x,1},celery{x,2})=4;
            else
                board(celery{x,1},celery{x,2})=2;
            end
        end
        
        if count == 0 %if passed a full board
            close;
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
                        for i=2:count %merges same blocks
                            if celery{i-1} == celery{i}
                                celery{i-1}=2*celery{i-1};
                            end
                        end
                    end
                    if count>0 %if there is stuff that could move
                        for j=1:length(celery) %puts updated blockchain in new array
                            array(j,c)=celery{j};
                        end
                    end
                end
                random(array);
                
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
                        for i=2:count %merges same blocks
                            if celery{i-1} == celery{i}
                                celery{i-1}=2*celery{i-1};
                            end
                        end
                    end
                    if count>0 %if there is stuff that could move
                        for j=1:length(celery) %puts updated blockchain in new array
                            array(r,j)=celery{j};
                        end
                    end
                end
                random(array);
                
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
                    celery2=fliplr(celery);
                    if count>1 %if there is stuff that could merge
                        for i=2:count %merges same blocks
                            if celery2{i-1} == celery2{i}
                                celery2{i-1}=2*celery2{i-1};
                            end
                        end
                    end
                    if count>0 %if there is stuff that could move
                        for j=1:count %puts updated blockchain in new array
                            array((5-j),c)=celery2{j};
                        end
                    end
                end
                random(array);
                
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
                        for i=2:count %merges same blocks
                            if celery2{i-1} == celery2{i}
                                celery2{i-1}=2*celery2{i-1};
                            end
                        end
                    end
                    if count>0 %if therse is stuff that could move
                        for j=1:length(celery) %puts updated blockchain in new array
                            array(r,(5-j))=celery2{j};
                        end
                    end
                end
                random(array);
                
            case 'q' %quit
                close;
                
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

    function gameOverMenu()
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
        
    end

end