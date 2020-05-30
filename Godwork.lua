GodClass = {
    SectionNames = {},
    VarNameWind = "",
    SectionReference = {},
    Sections = 0,
    SectionSelector = "",
    Window = "",
    CheckboxesN = 0,
    SliderN = 0,
    ButtonN = 0,
    GroupBoxN = 0,
    ColorPickerN = 0,
    ComboBoxN = 0,
    EditboxN = 0,
    KeyBoxN = 0,
    ListBoxN = 0,
    MultiBoxN = 0,
    TextN = 0
}
local add = 0
function Checkbox(Parent,Name,LeftorRight)
    GodClass.CheckboxesN = GodClass.CheckboxesN + 1
    if LeftorRight == 1 then
        x:SetPosX(570/2-10)
    else  
    end
    return gui.Checkbox( Parent, string.gsub(string.lower(Name), "%s+", ""), Name, 0 )
end

function Slider(Parent,Name,DefaultValue, Minimum, Maximum, StepSize,LeftorRight)
    GodClass.SliderN = GodClass.SliderN + 1
    local x = gui.Slider( Parent, string.gsub(string.lower(Name), "%s+", ""), Name, DefaultValue, Minimum, Maximum, StepSize)
    x:SetWidth(570/2-47)
    if LeftorRight == 1 then
        x:SetPosX(570/2-10)
    else  
    end
    return x
end
function GroupBox(Parent,Name,Y)
    add = add + Y
    GodClass.GroupBoxN = GodClass.GroupBoxN + 1
    zz = gui.Groupbox( Parent, Name, (570/2-25), Y, (570/2-15), 100 )
    return zz
end
function Button(Parent,Name,CallBack,LeftorRight)
    GodClass.ButtonN = GodClass.ButtonN + 1
    x=gui.Button( Parent, Name, CallBack)
    if LeftorRight == 1 then
        x:SetPosX(570/2-10)
    else  
    end
    return x
end

function ColorPicker(Parent,Name,LeftorRight)
    GodClass.ColorPickerN = GodClass.ColorPickerN + 1
    local x = gui.ColorPicker( Parent, string.gsub(string.lower(Name), "%s+", ""), Name, 255, 255, 255, 244 )
    x:SetWidth(570/2-15)
    if LeftorRight == 1 then
        x:SetPosX(570/2-10)
    else  
    end
    return x
end

function ComboBox(Parent,Name,OptionsTable,LeftorRight)
    GodClass.ComboBoxN = GodClass.ComboBoxN + 1
    local x =gui.Combobox( Parent, string.gsub(string.lower(Name), "%s+", ""), Name, unpack(OptionsTable))
    x:SetWidth(570/2-47)
    if LeftorRight == 1 then
        x:SetPosX(570/2-10)
    else  
    end
    return x
end

function Editbox(Parent,Name,LeftorRight)
    GodClass.EditboxN = GodClass.EditboxN + 1
    local x = gui.Editbox( Parent, string.gsub(string.lower(Name), "%s+", ""), Name )
    x:SetWidth(570/2-15)
    if LeftorRight == 1 then
        x:SetPosX(570/2-10)
    else  
    end
    return x
end

function KeyBox(Parent,Name,Key,LeftorRight)
    GodClass.KeyBoxN = GodClass.KeyBoxN + 1
    if Key == nil then Key = 0 end
    x = gui.Keybox( Parent, string.gsub(string.gsub(string.lower(Name), "%s+", ""), "%s+", ""), Name, Key)
    if LeftorRight == 1 then
        x:SetPosX(570/2-10)
    else  
    end
    return x
end

function ListBox(Parent,VarName,Height,OptionsTable,LeftorRight)
    GodClass.ListBoxN = GodClass.ListBoxN + 1
    local x = gui.Listbox( Parent, VarName, Height, OptionsTable)
    x:SetWidth(570/2-15)
    if LeftorRight == 1 then
        x:SetPosX(570/2-10)
    else  
    end
    return x
end

function MultiBox(Parent,Name,LeftorRight)
    GodClass.MultiBoxN = GodClass.MultiBoxN + 1
    local x = gui.Multibox( Parent, Name )
    if LeftorRight == 1 then
        x:SetPosX(570/2-10)
    else  
    end
    x:SetWidth(570/2-15)
    return x
end

function Text(Parent,Text)
    GodClass.TextN = GodClass.TextN + 1
    return gui.Text( Parent, Text )
end
W = 600 
H = 500
function Window(Name,Width,Height)
    GodClass.Window = gui.Window( string.gsub(Name, "%s+", ""), Name, 1000, 500, Width, Height)
    GodClass.SectionSelector = gui.Combobox( GodClass.Window, "sections", "Sections", "")
    GodClass.SectionSelector:SetWidth(570/2-15)
    GodClass.VarNameWind = string.gsub(string.lower(Name), "%s+", "")
    return GodClass.Window
end
function AddSection(Name)
    table.insert(GodClass.SectionNames, Name)
    table.insert(GodClass.SectionReference, gui.Groupbox( GodClass.Window, "Configure", 15, 70, W-30, H-15 ))
    GodClass.Sections = GodClass.Sections + 1
    return GodClass.SectionReference[GodClass.Sections]
end
function Unload()
    UnloadScript(GetScriptName())
end
function Handling()
    if gui.Reference("MENU"):IsActive() then
        GodClass.Window:SetActive(1)
    else
        GodClass.Window:SetActive(0)
    end
    GodClass.SectionSelector:SetOptions(unpack(GodClass.SectionNames))
    for i=1,(GodClass.Sections) do
        if i==(GodClass.SectionSelector:GetValue()+1) then
            GodClass.SectionReference[i]:SetInvisible(0)
        else
            GodClass.SectionReference[i]:SetInvisible(1)
        end
    end
    GodClass.Window:SetWidth(W-30)
    GodClass.Window:SetHeight(H-15)
end

local function adaptive()
    add = add + (GodClass.Sections * 2)
    add = add + (GodClass.CheckboxesN * 2)
    add = add + (GodClass.SliderN * 2)
    add = add + (GodClass.ButtonN * 2)
    add = add + (GodClass.ColorPickerN * 2)
    add = add + (GodClass.ComboBoxN * 2)
    add = add + (GodClass.EditboxN * 2)
    add = add + (GodClass.KeyBoxN * 2)
    add = add + (GodClass.ListBoxN * 2)
    add = add + (GodClass.MultiBoxN * 2)
    add = add + (GodClass.TextN * 2)
    GodClass.Window:SetHeight(560+add)
end

local function split (str, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(str, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

