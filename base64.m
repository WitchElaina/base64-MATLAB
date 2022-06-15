function output = base64(my_string)

    % 初始化base64加密的映射图, 左边为比特流中的十进制形式, 右边为对应的ASCII字符
    base64map = containers.Map({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64}, {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/', '=' });
    % 初始化加密后字符串
    ans = '';
    % 获取输入字符串长度
    len = size(my_string)
    % 将字符串转换成ASCII码
    ascii_codes=double(my_string);
    [row, col ] = size(ascii_codes);
    % 将十进制ASCII码转换为二进制比特流
    ascii = 0;
    bit_stream = '';
    for i = 1:col
        bit_stream = [bit_stream, dec2bin(ascii_codes(i), 8)];
    end
    [rol, col] = size(bit_stream)

    % 将比特流补全至24的倍数, 并计算空位起点
    fill_start = col;
    fill_start_setted = 0;
    while mod(col, 24) != 0
        if fill_start_setted != 1
            if (mod(col, 8) == 0 && (col / 8) > len(1)*8) 
                fill_start = col;
                fill_start_setted = 1;
            end
        end
        bit_stream = [bit_stream, '0'];
        [rol, col] = size(bit_stream);
    end

    % 打印补全后的比特流
    bit_stream

    % 将比特流中数据每6位一提取并转换成base64码
    loop_time = col / 6;
    for i = 1:loop_time
        if (6*(i-1)+1) >= fill_start
            % 到达补全位, 使用字符'='补全, 而不再使用映射
            ans = [ans,'='];
        else    
            ans = [ans, base64map(bin2dec(bit_stream(6*(i-1)+1 :6*i)))];
        end
    end

    % 打印base64加密后的结果
    ans
end