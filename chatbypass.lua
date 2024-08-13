local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Roblox Chat Bypass",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local BypassTab = Window:AddTab({ Title = "Bypass", Icon = "rbxassetid://7414445494" })

local Options = Fluent.Options

local fontMapping = {
    ["a"] = "å", ["b"] = "ƀ", ["c"] = "ç", ["d"] = "đ", ["e"] = "ȇ", ["f"] = "f", ["g"] = "ĝ", ["h"] = "ħ",
    ["i"] = "í", ["j"] = "ǰ", ["k"] = "κ", ["l"] = "l", ["m"] = "ɱ", ["n"] = "ň", ["o"] = "ο", ["p"] = "ƥ",
    ["q"] = "ʠ", ["r"] = "ŕ", ["s"] = "š", ["t"] = "ţ", ["u"] = "û", ["v"] = "v", ["w"] = "ѷ", ["x"] = "ẋ",
    ["y"] = "ƴ", ["z"] = "ž", [" "] = " "
}

local function convertToCustomFont(text)
    local result = ""
    for i = 1, #text do
        local char = text:sub(i, i):lower()
        result = result .. (fontMapping[char] or char)
    end
    return result
end

local Input = BypassTab:AddInput("Message", {
    Title = "Message",
    Default = "",
    Placeholder = "Type here..",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
    end
})

local SendButton = BypassTab:AddButton({
    Title = "Send",
    Description = "Send message in roblox chat",
    Callback = function()
        local inputValue = Input.Value
        local convertedText = convertToCustomFont(inputValue)
        game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(convertedText, "All")
    end
})

Window:SelectTab(BypassTab)