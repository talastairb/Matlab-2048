%{
Matlab 2048
Theodore Bastian (tab111)
Cole Williams
ENGR131
%}

function gui

rows=4;
cols=4;

f = figure('Position', [0 0 100*(rows+1) 100*cols], 'Visible', 'off', 'MenuBar', 'none', 'Name', '2048');
movegui(f, 'center')

board=[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]; %represents the value in each board position

static = cell(rows,cols);

score=0;

        for r = 1:rows
            for c =1:cols
                x=100*(cols-1);
                y=100*(rows+1)-(100*(rows-1));
                    static.(r)(c) = uicontrol('Style', 'text', 'Position', [x y  100 100], 'String', '');
                
            end
        end

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

button = uicontrol('Style', 'pushbutton', 'String', 'Save', 'Position',[000 000 100 050], 'Callback', @save);
button = uicontrol('Style', 'pushbutton', 'String', 'Load', 'Position',[100 000 100 050], 'Callback', @load);

set(f,'KeyPressFcn',@keyDownListener)

set(f, 'Visible', 'on') % We kept the window invisible until now to avoid displaying an unfinished version


    
    function update(array)
        
        %refreshes board
        
        board=array;

        count=0;
        
        for r = 1:rows
            for c =1:cols
                
                if board(r,c) == 0
                    set(static.(r)(c), 'String', '')
                    count =count+1;
                else
                    set(static.(r)(c), 'String', num2str(board(1,1)))
                end
                
            end
        end
    end

  function keyDownListener(src,event)    
    switch event.Key
      case 'w'
          
          update(array)

      case 'a'
          
          update(array)

      case 's'
          
          update(array)
          
      case 'd'
          
          update(array)
          
    end
    
  end

        
    % Callback function for buttons
    function save(source,eventdata)
       %saves board array to file
    end


    function load(source,eventdata)
       %loads file to board array
    end
end
