unit information;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrm_Information = class(TForm)
    LabUser: TLabel;
    LabDeptCode: TLabel;
    LabWareHouse: TLabel;
    LabPhoneNumber: TLabel;
    BitCancel: TBitBtn;
    BitSave: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BitUser: TBitBtn;
    BitDept: TBitBtn;
    BitWarehouse: TBitBtn;
    LabUserName: TLabel;
    LabDeptName: TLabel;
    LabAbbrName: TLabel;
    procedure BitUserClick(Sender: TObject);
    procedure BitDeptClick(Sender: TObject);
    procedure BitWarehouseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitSaveClick(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
  public
    user_pt,warehouse_pt:Integer;
    deptcod:string;
    status : Integer;
    { Public declarations }
  end;

var
  frm_Information: Tfrm_Information;

implementation

uses damo,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure Tfrm_Information.BitUserClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'USER_LOGIN_NAME/用户登陆名/180,USER_FULL_NAME/用户名/250';
    if (StrToInt(vprev) = 4) then
    begin
      InputVar.Sqlstr := 'select RKEY, USER_FULL_NAME, USER_LOGIN_NAME from Data0073 ';
    end
    else
    begin
      InputVar.Sqlstr := 'select RKEY, USER_FULL_NAME, USER_LOGIN_NAME from Data0073 where rkey='+rkey73;
    end;

    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit1.Text:=frmPick_Item_Single.adsPick.fieldbyname('USER_LOGIN_NAME').AsString;
      Edit1.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      LabUserName.Caption := frmPick_Item_Single.adsPick.FieldByName('USER_FULL_NAME').value;
    end;
  finally
    frmPick_Item_Single.Free;
  end
end;

procedure Tfrm_Information.BitDeptClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'DEPT_CODE/部门代码/180,DEPT_NAME/部门名称/250';
    if (StrToInt(vprev) = 4) then
    begin
      InputVar.Sqlstr := 'select rkey,DEPT_CODE,DEPT_NAME from Data0034 ORDER by DEPT_CODE';
    end
    else
    begin
      InputVar.Sqlstr := 'SELECT  Data0034.DEPT_CODE, Data0034.DEPT_NAME, Data0034.RKEY'+
      ' FROM Data0005 INNER JOIN Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY where data0005.rkey='+user_ptr;
    end;
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit2.Text:=frmPick_Item_Single.adsPick.fieldbyname('DEPT_CODE').AsString;
      Edit2.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      LabDeptName.Caption := frmPick_Item_Single.adsPick.FieldByName('DEPT_NAME').value;
    end;
  finally
    frmPick_Item_Single.Free;
  end

end;

procedure Tfrm_Information.BitWarehouseClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,abbr_name/工厂简称/150,WAREHOUSE_NAME/工厂名称/200';
    InputVar.Sqlstr := 'SELECT RKEY, WAREHOUSE_CODE,abbr_name, WAREHOUSE_NAME FROM Data0015 ORDER by WAREHOUSE_CODE';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit3.Text:=frmPick_Item_Single.adsPick.fieldbyname('WAREHOUSE_CODE').AsString;
      Edit3.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      LabAbbrName.Caption := frmPick_Item_Single.adsPick.FieldByName('abbr_name').value;
    end;
  finally
    frmPick_Item_Single.Free;
  end

end;

procedure Tfrm_Information.FormShow(Sender: TObject);
begin
  if status =1 then
  begin
    Edit1.Text := DM.ADS834USER_LOGIN_NAME.Value;
    Edit1.Tag := DM.ADS834User_ptr.Value;
    LabUserName.Caption := DM.ADS834USER_FULL_NAME.Value;
    Edit2.Text := DM.ADS834DeptCode.Value;
    LabDeptName.Caption := DM.ADS834DEPT_NAME.Value;
    Edit3.Text := DM.ADS834WAREHOUSE_CODE.Value;
    Edit3.Tag := DM.ADS834warehouse_ptr.Value;
    LabAbbrName.Caption := DM.ADS834ABBR_NAME.Value;
    Edit4.Text := DM.ADS834Phone.Value;
  end;
end;

procedure Tfrm_Information.BitSaveClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('用户登录名不能为空，请输入');
    Exit;
  end;
  if Edit2.Text = '' then
  begin
    ShowMessage('部门代码不能为空，请输入');
    Exit;
  end;
  if Edit3.Text = '' then
  begin
    ShowMessage('工厂代码不能为空，请输入');
    Exit;
  end;
  if Edit4.Text ='' then
  begin
    ShowMessage('电话不能为空，请输入');
    Exit;
  end;
  if status=0 then
  begin
    with dm.tmp do
    begin
      Close;
      SQL.Text := 'select User_ptr,DeptCode,warehouse_ptr from data0834 where User_ptr='+IntToStr(edit1.Tag)+
      ' and DeptCode='+quotedstr(edit2.text)+' and warehouse_ptr='+IntToStr(edit3.Tag);
      Open;
      if not IsEmpty then
      begin
        ShowMessage('记录已存在，请修改''部门代码''或者''工厂代码''或者''用户登陆名''再保存');
        Exit;
      end;
    end;
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'insert into data0834(User_ptr,DeptCode,Phone,warehouse_ptr)'+
      ' values('+IntToStr(edit1.Tag)+ ','+quotedstr(edit2.text)+','+edit4.Text+','+IntToStr(edit3.Tag)+')';
      ExecSQL;
      user_pt:=edit1.Tag;
      deptcod := edit2.text;
      warehouse_pt := edit3.Tag;
    end;
    ModalResult := mrOk;
  end
  else
  if status=1 then
  begin
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'update data0834 set User_ptr='+IntToStr(edit1.Tag)+',DeptCode='+quotedstr(edit2.text)+
      ',Phone='+edit4.Text+',warehouse_ptr='+IntToStr(edit3.Tag)+' where User_ptr='+DM.ADS834User_ptr.AsString+
      ' and DeptCode='+quotedstr(dm.ADS834DeptCode.AsString)+' and warehouse_ptr='+dm.ADS834warehouse_ptr.AsString;
      ExecSQL;
      user_pt:=edit1.Tag;
      deptcod := edit2.text;
      warehouse_pt := edit3.Tag;
    end;
    ModalResult :=mrOk;
  end;
end;

procedure Tfrm_Information.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort//判断是否输入数字
  else
  if key = chr(46) then
  if pos('.',Edit4.Text)>0then abort;//第二列小数点'.'不能重复
end;

end.
