unit PasModifyHour;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, Menus;

type
  TfrmModifyHour = class(TForm)
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtName: TEdit;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    DBGridEh1: TDBGridEh;
    Label4: TLabel;
    Memo1: TMemo;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModifyHour: TfrmModifyHour;

implementation

uses common,Pick_Item_Single,ConstVar,PasDM, PasQuery;

{$R *.dfm}

procedure TfrmModifyHour.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmModifyHour.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9','.',#8,#13]) then Key:=#0;
end;

procedure TfrmModifyHour.BitBtn3Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  try
    ComboBox1.Items.Clear;
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'WORK_ORDER_NUMBER/作业单号/220,MANU_PART_NUMBER/本厂编号/250';
    InputVar.Sqlstr :='SELECT distinct D25.MANU_PART_NUMBER, D06.WORK_ORDER_NUMBER, D06.Rkey as Rkey06,D25.Rkey as Rkey25'
                     +' FROM dbo.Data0025 AS D25 INNER JOIN dbo.Data0006 AS D06 ON D25.RKEY = D06.BOM_PTR'
                     +' WHERE (D06.PROD_STATUS = 3) and D25.TType=d06.PRIORITY_CODE'
                  +' and (D06.RELEASE_DATE >='+quotedstr(formatdatetime('YYYY-MM-DD',FrmQuery.DateTimePicker3.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker4.Time))+')'
                  +' and (D06.RELEASE_DATE <='+quotedstr(formatdatetime('YYYY-MM-DD',FrmQuery.DateTimePicker5.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker6.Time))+')';
    inputvar.KeyField:='WORK_ORDER_NUMBER';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtName.Text:=frmPick_Item_Single.adsPick.FieldValues['WORK_ORDER_NUMBER'];
      edtName.Tag:=frmPick_Item_Single.adsPick.FieldValues['Rkey06'];
      ComboBox1.Tag:=frmPick_Item_Single.adsPick.FieldValues['Rkey25'];

      DM.tmp.Close;
      dm.tmp.SQL.Text:='select D34.Rkey as Rkey34,D34.DEPT_CODE,D34.DEPT_NAME,D38.STEP_NUMBER '
                      +' from dbo.Data0038 as D38 INNER JOIN dbo.Data0034 AS D34 ON D38.DEPT_PTR = D34.RKEY '
                      +' where (D34.BARCODE_ENTRY_FLAG = ''Y'') AND (D34.ACTIVE_FLAG = 0) and D38.SOURCE_PTR='+quotedstr(IntToStr(ComboBox1.Tag))+' ORDER BY D38.STEP_NUMBER';
      dm.tmp.Open;
      if not dm.tmp.IsEmpty then
      begin
        while not dm.tmp.Eof do
        begin
          ComboBox1.Items.Add(dm.tmp.fieldBYName('DEPT_CODE').AsString+' '+dm.tmp.fieldBYName('DEPT_NAME').AsString+'['+dm.tmp.fieldBYName('STEP_NUMBER').AsString+']');
          dm.tmp.Next;
        end;
      end;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmModifyHour.ComboBox1Change(Sender: TObject);
var stmp:string;
    itmp:Integer;
begin
  if (Trim(ComboBox1.Text)<>'') then
  begin
    itmp:=Pos('[',ComboBox1.Text);
    stmp:=Copy(ComboBox1.Text,itmp+1,Length(ComboBox1.Text)-itmp-1);
    Edit1.Tag:=StrToInt(stmp);
  end;
end;

procedure TfrmModifyHour.BitBtn2Click(Sender: TObject);
begin
  if (Trim(Edit1.Text)='') then
  begin
    ShowMsg('时长不能为空！',1);
    Exit;
  end;
  if (Trim(edtName.Text)='') then
  begin
    ShowMsg('作业单号不能为空！',1);
    Exit;
  end;
  if (Trim(ComboBox1.Text)='') then
  begin
    ShowMsg('工序不能为空！',1);
    Exit;
  end;
  DM.tmp.Close;
  DM.tmp.SQL.Clear;
  DM.tmp.SQL.Text:='select * from data0587 where Rkey06='+inttostr(edtName.Tag)+' and STEP_NUMBER='+inttostr(Edit1.Tag);
  DM.tmp.open;
  if not dm.tmp.IsEmpty then
  begin
    if (MessageBox(Handle,'该作业单对应当前工序时长已设置,'+#13+'确定重新设置吗?','重新设置提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
    DM.tmp.Close;
    DM.tmp.SQL.Clear;
    DM.tmp.SQL.Text:='update data0587 set PROCESS_Add_TIME='+edit1.Text+',Remark='''+Trim(Memo1.Text)
                    +''',User_Ptr='+user_ptr+',OperDate='''+formatdatetime('yyyy-MM-dd HH:mm:ss',getsystem_date(DM.tmp,0))
                    +''' where Rkey06='+inttostr(edtName.Tag)+' and STEP_NUMBER='+inttostr(Edit1.Tag);
    DM.tmp.ExecSQL;
  end else
  begin
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Clear;
    DM.ADOQuery1.SQL.Text:='Insert into data0587 (RKey06,Rkey25,STEP_NUMBER,PROCESS_Add_TIME,User_Ptr,OperDate,Remark) Values (:RKey06,:Rkey25,:STEP_NUMBER,:PROCESS_Add_TIME,:User_Ptr,:OperDate,:Remark)';
    DM.ADOQuery1.Parameters.ParamByName('RKey06').Value:=edtName.Tag;
    DM.ADOQuery1.Parameters.ParamByName('Rkey25').Value:=ComboBox1.Tag;
    dm.ADOQuery1.Parameters.ParamByName('STEP_NUMBER').Value:=Edit1.Tag;
    dm.ADOQuery1.Parameters.ParamByName('PROCESS_Add_TIME').Value:=StrToFloat(Edit1.Text);
    dm.ADOQuery1.Parameters.ParamByName('User_Ptr').Value:=user_ptr;
    DM.ADOQuery1.Parameters.ParamByName('OperDate').Value:=getsystem_date(dm.tmp,0);
    dm.ADOQuery1.Parameters.ParamByName('Remark').Value:=Trim(Memo1.Text);
    DM.ADOQuery1.ExecSQL;
  end;
  
  DM.Ado587s.Close;
  DM.Ado587s.Open;
end;

procedure TfrmModifyHour.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (not dm.Ado587s.IsEmpty) then
  begin
    try
      DM.tmp.Close;
      DM.tmp.SQL.Clear;
      DM.tmp.SQL.Text:='delete data0587 where Rkey06='+dm.Ado587sRkey06.AsString+' and STEP_NUMBER='+dm.Ado587sSTEP_NUMBER.AsString;
      DM.tmp.ExecSQL;
      DM.Ado587s.Close;
      DM.Ado587s.Open;
    finally
    end;
  end;
end;

procedure TfrmModifyHour.FormShow(Sender: TObject);
begin
  DM.Ado587s.Close;
  DM.Ado587s.Open;
end;

procedure TfrmModifyHour.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in shift) and  (chr(key)='S') then
    showmessage(DM.Ado587s.SQL.Text);
end;

end.
