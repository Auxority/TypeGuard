--!strict

export type TableType = {[any]: any}

return function(length: number): (value: TableType) -> boolean
    return function(value: TableType): boolean
        return #value == length
    end
end
