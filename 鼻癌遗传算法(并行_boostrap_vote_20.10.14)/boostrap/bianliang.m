    clear
    clc;
    delete('feature_name.xlsx');
%     pop=xlsread('vote__.xlsx');
%     pop=xlsread('testpop2.xlsx');
    pop=xlsread('testpop2.xlsx');
    [px_pop,py_pop] = size(pop);
    tx=xlsread('train300.xlsx');
    [px_tx,py_tx] = size(tx);
    % Éú³ÉExcel
    [~,txt] = xlsread('train300.xlsx');
    [x_result,y_result] = size(pop);
    for x = 1 : x_result
            n = 1;
            for y = 5 : y_result
                if pop(x,y) == 1
                    A(x,n) = txt(1,y);
                    n = n+1;
                end
            end
    end
    xlswrite('feature_name.xlsx',A);
    