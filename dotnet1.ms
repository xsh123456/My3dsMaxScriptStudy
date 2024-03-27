macroScript MyBase
category:"MyTools"
ButtonText:"Base"
toolTip:"Base"
silentErrors:true
autoUndoEnabled:true


(
fn createDotNetWindow = 
(
    -- ��������
    local myForm = dotNetObject "System.Windows.Forms.Form"
    myForm.StartPosition = (dotNetClass "System.Windows.Forms.FormStartPosition").CenterScreen
    myForm.Size = dotNetObject "System.Drawing.Size" 200 40
    myForm.Text = "DotNet Window"
    myForm.FormBorderStyle = (dotNetClass "System.Windows.Forms.FormBorderStyle").None

    -- ������ť�������ı�
    local myButton = dotNetObject "System.Windows.Forms.Button"
    myButton.Text = "Hover and Release Me"
    myButton.Dock = (dotNetClass "System.Windows.Forms.DockStyle").Fill

    -- ��������ͷţ�MouseUp���¼�������
    fn onMouseUp sender args =
    (
        print "Mouse Button Released"
        sender.Parent.Close() -- �رհ�ť�ĸ����ڣ���myForm
    )
    dotNet.addEventHandler myButton "MouseUp" onMouseUp

    -- ���������ͣ��MouseEnter���¼�������
    fn onMouseEnter sender args =
    (
        subObjectLevel = 1
		if subObjectLevel == 1 then sender.Parent.Close()
        -- ��������������Ӹ�����߼�������ı䰴ť��ɫ��
    )
    dotNet.addEventHandler myButton "MouseEnter" onMouseEnter

    -- ����ť���ӵ�����
    myForm.Controls.Add(myButton)

    -- ��ʾ����
    myForm.Show()
)

-- ���ú����Դ�������ʾ����
createDotNetWindow()

)

