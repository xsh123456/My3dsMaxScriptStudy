macroScript MyBase
category:"MyTools"
ButtonText:"Base"
toolTip:"Base"
silentErrors:true
autoUndoEnabled:true


(
fn createDotNetWindow = 
(
    -- 创建窗体
    local myForm = dotNetObject "System.Windows.Forms.Form"
    myForm.StartPosition = (dotNetClass "System.Windows.Forms.FormStartPosition").CenterScreen
    myForm.Size = dotNetObject "System.Drawing.Size" 200 40
    myForm.Text = "DotNet Window"
    myForm.FormBorderStyle = (dotNetClass "System.Windows.Forms.FormBorderStyle").None

    -- 创建按钮并设置文本
    local myButton = dotNetObject "System.Windows.Forms.Button"
    myButton.Text = "Hover and Release Me"
    myButton.Dock = (dotNetClass "System.Windows.Forms.DockStyle").Fill

    -- 添加鼠标释放（MouseUp）事件处理器
    fn onMouseUp sender args =
    (
        print "Mouse Button Released"
        sender.Parent.Close() -- 关闭按钮的父窗口，即myForm
    )
    dotNet.addEventHandler myButton "MouseUp" onMouseUp

    -- 添加鼠标悬停（MouseEnter）事件处理器
    fn onMouseEnter sender args =
    (
        subObjectLevel = 1
		if subObjectLevel == 1 then sender.Parent.Close()
        -- 你可以在这里添加更多的逻辑，比如改变按钮颜色等
    )
    dotNet.addEventHandler myButton "MouseEnter" onMouseEnter

    -- 将按钮添加到窗体
    myForm.Controls.Add(myButton)

    -- 显示窗体
    myForm.Show()
)

-- 调用函数以创建并显示窗体
createDotNetWindow()

)


