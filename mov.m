function mov(control_signal, start_point, direc)
    len = length(control_signal);
    figure;
    for i = 1:len
        switch control_signal(i)
            case 1
                switch direc
                    case 1
                        plot([start_point(1),start_point(1)], [start_point(2),start_point(2)+1]);
                        start_point(2) = start_point(2) + 1;
                        hold on;
                    case 2
                        plot([start_point(1),start_point(1)-1], [start_point(2),start_point(2)]);
                        start_point(1) = start_point(1) - 1;
                        hold on;
                    case 3
                        plot([start_point(1),start_point(1)], [start_point(2),start_point(2)-1]);
                        start_point(2) = start_point(2) - 1;
                        hold on;
                    case 0
                        plot([start_point(1),start_point(1)+1], [start_point(2),start_point(2)]);
                        start_point(1) = start_point(1) + 1;
                        hold on;
                end
            case 2
                direc = mod(-direc, 4);
                switch direc
                    case 1
                        plot([start_point(1),start_point(1)], [start_point(2),start_point(2)+1]);
                        start_point(2) = start_point(2) + 1;
                        hold on;
                    case 2
                        plot([start_point(1),start_point(1)-1], [start_point(2),start_point(2)]);
                        start_point(1) = start_point(1) - 1;
                        hold on;
                    case 3
                        plot([start_point(1),start_point(1)], [start_point(2),start_point(2)-1]);
                        start_point(2) = start_point(2) - 1;
                        hold on;
                    case 0
                        plot([start_point(1),start_point(1)+1], [start_point(2),start_point(2)]);
                        start_point(1) = start_point(1) + 1;
                        hold on;
                end
            case 3
                direc = mod(direc+1, 4);
                switch direc
                    case 1
                        plot([start_point(1),start_point(1)], [start_point(2),start_point(2)+1]);
                        start_point(2) = start_point(2) + 1;
                        hold on;
                    case 2
                        plot([start_point(1),start_point(1)-1], [start_point(2),start_point(2)]);
                        start_point(1) = start_point(1) - 1;
                        hold on;
                    case 3
                        plot([start_point(1),start_point(1)], [start_point(2),start_point(2)-1]);
                        start_point(2) = start_point(2) - 1;
                        hold on;
                    case 0
                        plot([start_point(1),start_point(1)+1], [start_point(2),start_point(2)]);
                        start_point(1) = start_point(1) + 1;
                        hold on;
                end
            case 4
                direc = mod(direc-1, 4);
                switch direc
                    case 1
                        plot([start_point(1),start_point(1)], [start_point(2),start_point(2)+1]);
                        start_point(2) = start_point(2) + 1;
                        hold on;
                    case 2
                        plot([start_point(1),start_point(1)-1], [start_point(2),start_point(2)]);
                        start_point(1) = start_point(1) - 1;
                        hold on;
                    case 3
                        plot([start_point(1),start_point(1)], [start_point(2),start_point(2)-1]);
                        start_point(2) = start_point(2) - 1;
                        hold on;
                    case 0
                        plot([start_point(1),start_point(1)+1], [start_point(2),start_point(2)]);
                        start_point(1) = start_point(1) + 1;
                        hold on;
                end
            case 5
        end
    end
    axis padded
    title("轨迹控制图");
    
end