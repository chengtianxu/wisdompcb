unit EquipmentTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrm_EquipmentTime = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Cbb_MainCycl: TComboBox;
    Label6: TLabel;
    Edit3: TEdit;
    BtnSave: TBitBtn;
    BtnCancle: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
     function find_code(code:string;maincycl:string):Boolean;
    { Private declarations }
  public
    v_status,rkey847 : Integer;
    { Public declarations }
  end;

var
  frm_EquipmentTime: Tfrm_EquipmentTime;

implementation

uses damo,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure Tfrm_EquipmentTime.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'FASSET_CODE/设备代码/100,FASSET_NAME/设备名称/150,DEPT_CODE/部门代码/80,DEPT_NAME/部门名称/150';
    InputVar.Sqlstr := 'select data0034.DEPT_CODE,data0034.DEPT_NAME,d17.FASSET_CODE,d17.DEPT_PTR,d17.FASSET_NAME,d17.rkey,data0847.D417_ptr'+
    ' from data0417 d17 join data0034 on d17.DEPT_PTR=data0034.rkey left join Data0847 on Data0847.D417_ptr=d17.rkey order by FASSET_CODE';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit1.Text:=frmPick_Item_Single.adsPick.fieldbyname('FASSET_CODE').AsString;
      Edit1.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      Label4.Caption := frmPick_Item_Single.adsPick.FieldByName('FASSET_NAME').value;
      edit2.Text:=frmPick_Item_Single.adsPick.fieldbyname('DEPT_CODE').AsString;
//      Edit2.Tag:= frmPick_Item_Single.adsPick.fieldbyname('DEPT_PTR').asinteger;
      Label5.Caption := frmPick_Item_Single.adsPick.FieldByName('DEPT_NAME').value;
    end;
  finally
    frmPick_Item_Single.Free;
  end
end;

procedure Tfrm_EquipmentTime.Edit1Exit(Sender: TObject);
begin
  if(Trim(Edit1.Text))<>'' then
  with dm.tmp do
  begin
    close;
    sql.Text:='select data0034.DEPT_CODE,data0034.DEPT_NAME,d17.FASSET_CODE,d17.DEPT_PTR,d17.FASSET_NAME,d17.rkey,data0847.D417_ptr'+
    ' from data0417 d17 join data0034 on d17.DEPT_PTR=data0034.rkey left join Data0847 on Data0847.D417_ptr=d17.rkey'+
    ' where d17.FASSET_CODE='''+trim(edit1.Text)+'''';
    open;

    if isempty then
    begin
      showmessage('设备代码不存在，请输入正确的设备代码');
      edit1.Text:='';
      edit1.SetFocus;
    end
    else
    begin
      Edit1.Tag := FieldByName('rkey').Value;
      Label4.Caption := FieldByName('FASSET_NAME').Value;
      Edit2.Text :=  FieldByName('DEPT_CODE').Value;
//      Edit2.Tag := FieldByName('DEPT_PTR').Value;
      Label5.Caption := FieldByName('DEPT_NAME').Value;
    end;
  end
  else
  begin
    edit1.Tag := 0 ;
    Label4.Caption := '';
    Edit2.Text :=  '';
//    Edit2.Tag :=0;
    Label5.Caption := '';
  end;
end;

procedure Tfrm_EquipmentTime.FormShow(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT cycl_duration, MainCycl, Rkey FROM Data0816');
    open;
  end;
  DM.tmp.First;
  Cbb_MainCycl.Items.Clear;
  while not DM.tmp.Eof do
  begin
    Cbb_MainCycl.Items.AddObject(DM.tmp.FieldValues['MainCycl'],Pointer(DM.tmp.FieldByName('rkey').AsInteger));
    DM.tmp.Next;
  end;
  if v_status = 1 then       //编辑
  begin
    Edit1.Text := DM.ADS847FASSET_CODE.Value;
    Label4.Caption := DM.ADS847FASSET_NAME.Value;
    Edit2.Text := DM.ADS847DEPT_CODE.Value;
    Label5.Caption := DM.ADS847DEPT_NAME.Value ;
    Cbb_MainCycl.ItemIndex :=Cbb_MainCycl.Items.IndexOf(DM.ADS847.FieldByName('MainCycl').AsString);
    Edit3.Text := DM.ADS847StdTimeCons.AsString;
  end;

end;

function Tfrm_EquipmentTime.find_code(code: string;maincycl:string): Boolean;
begin
  with dm.tmp do
  begin
    close;
    sql.Text:='select data0847.rkey from data0847 inner join data0417 on data0847.D417_ptr = DATA0417.RKEY'+
    ' where MainCycl='''+maincycl+''' and FASSET_CODE='''+code+'''';
    open;
    if IsEmpty then
      Result:=False
    else
      Result:=true;
  end;

end;

procedure Tfrm_EquipmentTime.BtnSaveClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('设备代码不能为空，请输入设备代码');
    Exit;
  end;
  if Cbb_MainCycl.ItemIndex = -1 then
  begin
    ShowMessage('保养周期不能为空，请输入保养周期');
    Exit;
  end;
  if Edit3.Text = '' then
  begin
    ShowMessage('标准时间不能为空，请输入标准时间');
    Exit;
  end;
  if v_status=0 then //新增
  begin
    if self.find_code(Edit1.Text,Cbb_MainCycl.Text) then
    begin
     messagedlg('预算代码重复,请重输入!',mtinformation,[mbcancel],0);
     edit1.SetFocus;
     exit;
    end;
    with DM.tmp do
    begin
      Close;
//      SQL.Text := 'select data0034.DEPT_CODE,data0034.DEPT_NAME,d17.DEPT_PTR,d17.FASSET_CODE,'+
//        ' d17.FASSET_NAME,data0847.RKEY, data0847.D417_ptr, data0847.MainCycl, data0847.StdTimeCons'+
//        ' from dbo.Data0847 join data0417 d17 on Data0847.D417_ptr=d17.rkey'+
//        ' join data0816 on Data0847.MainCycl=data0816.MainCycl'+
//        ' join data0034 on d17.DEPT_PTR=data0034.rkey where data0847.rkey is null';

      SQL.Text := 'select data0847.RKEY, data0847.D417_ptr, data0847.MainCycl, data0847.StdTimeCons from data0847 where data0847.rkey is null';
      Open;
      Append;
      FieldByName('D417_ptr').Value := Edit1.Tag;
      FieldByName('MainCycl').Value := Cbb_MainCycl.Text;
      FieldByName('StdTimeCons').Value := Edit3.Text;
      Post;
      rkey847 := FieldByName('rkey').Value;
    end;
    ModalResult := mrOk;
  end
  else if v_status =1 then
  begin
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'select data0847.RKEY, data0847.D417_ptr, data0847.MainCycl, data0847.StdTimeCons'+
      ' from data0847 where data0847.rkey ='+inttostr(rkey847);
      Open;
      Edit;
      FieldByName('D417_ptr').Value := Edit1.Tag;
      FieldByName('MainCycl').Value := Cbb_MainCycl.Text;
      FieldByName('StdTimeCons').Value := Edit3.Text;
      Post;

    end;
    ModalResult := mrOk;
  end;

end;



procedure Tfrm_EquipmentTime.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then abort//判断是否输入数字
  else
  if key = chr(46) then
  if pos('.',Edit3.Text)>0then abort;//第二列小数点'.'不能重复
end;

end.
