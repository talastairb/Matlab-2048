%{
Matlab 2048
Theodore Bastian (tab111)
Cole Williams
ENGR131
%}

function gui

f = figure('Position', [0 0 400 500], 'Visible', 'off', 'MenuBar', 'none', 'Name', '2048'); %gui requirement

movegui(f, 'center')
       
score=0;

static11 = uicontrol('Style', 'text', 'Position', [000 400 100 100], 'String', '');
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

    
board=[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]; %represents the value in each board position

update(board);



function update(array) %function requirement
        
        %refreshes board
        
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
                
                if count >0
                    x=randi(count);

                    if randi(3)==1 %will be displayed next turn
                        board(celery{x,1},celery{x,2})=4;
                    else
                        board(celery{x,1},celery{x,2})=2;
                    end
                end
                
                
          
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

  function keyDownListener(source,eventdata)
      
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
          update(array);

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
          update(array);

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
              if count>1 %if there is stuff that could merge
                  for i=2:count %merges same blocks
                      if celery{i-1} == celery{i}
                          celery{i-1}=2*celery{i-1};
                      end
                  end
              end
              if count>0 %if there is stuff that could move
                  for j=1:count %puts updated blockchain in new array
                      array((5-j),c)=celery{j};
                  end
              end
          end
          update(array);
          
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
              if count>1 %if there is stuff that could merge
                  for i=2:count %merges same blocks
                      if celery{i-1} == celery{i}
                          celery{i-1}=2*celery{i-1};
                      end
                  end
              end
              if count>0 %if there is stuff that could move
                  for j=1:length(celery) %puts updated blockchain in new array
                      array(r,(5-j))=celery{j};
                  end
              end
          end
          update(array);
          
    end
    
  end

        
    % Callback function for buttons
    function save(source,eventdata) %data write requirement
        fid = fopen('game.txt','w');
        if fid>2
            for r = 1:4
                for c = 1:4
                    fprintf(fid,'%d\n', board(r,c));
                end
            end
        end
        fclose(fid);
        set(f,'KeyPressFcn',@keyDownListener)
    end

    function load(source,eventdata) %data read requirement
        fclose('all');
        fid = fopen('game.txt','r');
        if fid>2
            a = textscan(fid,'%d');
            count=1;
            for r = 1:4
                for c = 1:4
                    board(r,c)=a(count)
                end
            end
        end
        fclose(fid);
    end

end
