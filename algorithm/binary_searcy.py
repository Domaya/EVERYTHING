
def binary_search(element, some_list, start_index=0, end_index=None):
    # end_index가 따로 주어지지 않은 경우에는 리스트의 마지막 인덱스
    if end_index == None:
        end_index = len(some_list) - 1

    if start_index == end_index:
        if some_list[start_index] == element:
            return start_index
        else:
            return None
        
    if start_index>end_index:
        return None

    m = (start_index + end_index)//2

    if some_list[m] == element:
        return m
    elif some_list[m] > element:
        return binary_search(element, some_list, start_index, m - 1)
    elif some_list[m] < element:
        return binary_search(element, some_list, m+1, end_index)
    

print(binary_search(2, [2, 3, 5, 7, 11]))
print(binary_search(0, [2, 3, 5, 7, 11]))
print(binary_search(5, [2, 3, 5, 7, 11]))
print(binary_search(3, [2, 3, 5, 7, 11]))
print(binary_search(11, [2, 3, 5, 7, 11]))
