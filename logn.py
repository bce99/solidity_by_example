def logn(arr, length, num):
    start = 0
    end = length - 1
    while start <= end:
        mid = (start + end) // 2
        if arr[mid] == num:
            return mid
        elif arr[mid] < num:
            start = mid + 1
        else:
            end = mid - 1
    return end + 1

print(logn([1, 3, 5, 6], 4, 5))
print(logn([1, 3, 5, 6], 4, 2))
