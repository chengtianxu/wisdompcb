unit edit_req;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, DB, ADODB,
  Menus, ComCtrls,raFunc, Spin, ExtCtrls;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn9: TBitBtn;
    Label18: TLabel;
    Label6: TLabel;
    Edit5: TEdit;
    BitBtn8: TBitBtn;
    Label7: TLabel;
    PopupMenu3: TPopupMenu;
    N7: TMenuItem;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label3: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    pnlProc: TPanel;
    Label5: TLabel;
    Label12: TLabel;
    Edit4: TEdit;
    BitBtn7: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
  private
    v_close:byte; //正常退出标识
  public
    warehouse_type:string;
  end;

var
  Form2: TForm2;
  
implementation

uses damo, addedit_requ, main;

{$R *.dfm}

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  dm.ADO301.CancelBatch();
  dm.adowz300.Cancel;
  v_close:=1;
  close;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
  try
    form3:=tform3.Create(application);
    dm.ADO301.Edit;
    form3.DateTimePicker1.Date:=dm.ADO301REQ_DATE.Value;
    if form3.ShowModal=mrok then
    begin
      dm.ADO301REQ_DATE.Value:=form3.DateTimePicker1.Date;
      dm.ADO301.Post;
    end;
  finally
    form3.free;
  end;
end;

procedure TForm2.N1Click(Sender: TObject);//新标准请购项目
var
  rec_count,rec_no:word;
begin
  try
    form3:=tform3.Create(application);
    rec_count:=dm.ADO301.RecordCount;
    rec_no:=dm.ADO301.RecNo;
    dm.ADO301.Append;
    if dm.adowz300rkey.Value>0 then
      dm.ADO301EPIBOLY_PTR.Value:=dm.adowz300rkey.Value;//给主表指针赋值
    form3.DateTimePicker1.Date:=form1.sys_shortdate;
    dm.ADO301UNIT_NAME.Value:='PNL';
    form3.ShowModal;
    if dm.ADO301.RecordCount=rec_count then
      dm.ADO301.MoveBy(rec_no-dm.ADO301.RecNo);
  finally
    form3.Free;
  end;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
  if dm.ADO301RECEVIED_QTY.Value>0 then
    showmessage('无法删除该记录已经有收货记录!')
  else
    dm.ADO301.Delete;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
  if dm.ado301.IsEmpty then
  begin
    n2.Enabled := false;
    n3.Enabled := false;
  end
  else
  begin
    n2.Enabled := true;
    n3.Enabled := true;
  end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
//==============================================================================
  dm.ADOConnection1.BeginTrans;   //起用事物处理
  if dm.adowz300.State = dsedit then //如果是编辑状态
  begin      //开始编辑
    dm.adowz300.Post;
    dm.ado301.UpdateBatch();  //保存标准请购
    try
      dm.ADOConnection1.CommitTrans;
      v_close := 1;
      ModalResult:=mrok;
    except
      dm.ADOConnection1.RollbackTrans;
      showmessage('数据提交不成功请取消操作重来一次，或通知管理员');
      dbedit8.SetFocus;
    end;
  end      //结束编辑
  else
  begin  //开始新增
    dm.adowz300.Post;
    dm.ADO301.First;
    while not dm.ADO301.Eof do
    begin
      dm.ADO301.Edit;
      dm.ADO301EPIBOLY_PTR.Value:=dm.adowz300rkey.Value;
      dm.ADO301.Post;
      dm.ADO301.Next;
    end;
    dm.ado301.UpdateBatch();
    try
      dm.ADOConnection1.CommitTrans;
      v_close:=1;
      ModalResult:=mrok;
    except
      dm.ADOConnection1.RollbackTrans;
      dbedit8.SetFocus;
    end;
  end;//结束新增
end;

procedure TForm2.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.N7Click(Sender: TObject);
begin
  try
    form3:=tform3.Create(application);
    with form3 do
    begin
      DateTimePicker1.Date:=dm.ADO301REQ_DATE.Value;
      DateTimePicker1.Enabled:=false;
      BitBtn3.Enabled:=false;
      dbcombobox1.Enabled:=false;
      dbcombobox2.Enabled:=false;
      dbedit1.Enabled := false;
      dbedit2.Enabled := false;
      dbedit3.Enabled := false;
      dbedit4.Enabled := false;
      dbedit5.enabled := false;
      dbedit6.enabled := false;
      dbedit7.Enabled := false;
      dbedit8.enabled := false;
      dbedit9.enabled := false;

      button1.Visible:=false;
      button2.Visible:=false;
      button3.Visible:=true;
    end;
    form3.ShowModal;
  finally
    form3.free;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  edit1.Text:=dm.wzdata300WAREHOUSE_CODE.Value;
  label9.Caption:=dm.wzdata300WAREHOUSE_NAME.Value;
  edit5.Text:=dm.wzdata300CODE.Value;
  label7.Caption:=dm.wzdata300SUPPLIER_NAME.Value;
  edit4.Text:=dm.wzdata300DEPT_CODE.Value;
  label12.Caption:=dm.wzdata300DEPT_NAME.Value;
  edit2.Text:=dm.wzdata300auth_code.Value;
  label10.Caption:=dm.wzdata300PURCHASE_APPROV_DESC.Value;
  edit1.Font.Color := clwindowtext;
  edit2.Font.Color := clwindowtext;
  edit4.Font.Color := clwindowtext;
  edit5.Font.Color := clwindowtext;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
  if (trim(dm.adowz300epiboly_number.Value)='') then
  begin
    showmessage('外发申请编号不能为空!');
    dbedit8.SetFocus;
    exit;
  end;
  if dm.ado301.IsEmpty then
  begin
    messagedlg('至少需要一项外发申请!',mtinformation,[mbcancel],0);
    dbgrid1.SetFocus;
    exit;
  end;
  if trim(edit1.Text)='' then
  begin
    messagedlg('请输入正确的工厂代码!',mtinformation,[mbcancel],0);
    edit1.SetFocus;
    exit;
  end;
  if trim(edit2.Text)='' then
  begin
    messagedlg('请输入正确的授权代码!',mtinformation,[mbcancel],0);
    edit2.SetFocus;
    exit;
  end;
  if trim(edit4.Text)='' then
  begin
    messagedlg('请输入正确的外发工序!',mtinformation,[mbcancel],0);
    edit4.SetFocus;
    exit;
  end;
  if trim(edit5.Text)='' then
  begin
    messagedlg('请输入正确的供应商!',mtinformation,[mbcancel],0);
    edit5.SetFocus;
    exit;
  end;
end;

end.
