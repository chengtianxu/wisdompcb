unit PasTrackMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus, Provider,
  DB, DBClient, ComCtrls,StrUtils;

type
  TfrmTrackMain = class(TForm)
    Panel5: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    DataSource1: TDataSource;
    CDS: TClientDataSet;
    DSP: TDataSetProvider;
    DataSource2: TDataSource;
    PopupMenu2: TPopupMenu;
    Panel1: TPanel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    CheckBox6: TCheckBox;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    Button1: TButton;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CDSAfterScroll(DataSet: TDataSet);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CDSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure item_click(sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Sqlstr:string;
    sSQLTxt:string;
    date,date2:TDateTime;
    PreColumn: TColumnEh;
    field_name:string;
    StartDate,EndDate:TDatetime;
    { Private declarations }
    procedure checkvar();
  public
    { Public declarations }
  end;

var
  frmTrackMain: TfrmTrackMain;

implementation

uses PasDM,common, PasQuery, PasExplanation;

{$R *.dfm}
procedure TfrmTrackMain.checkvar();
begin
   if not Checkbox1.Checked  then
    DM.Ado439.Parameters.ParamByName('v1').Value :=0
   else
    DM.Ado439.parameters.ParamByName('v1').Value :=9;
   if not Checkbox2.Checked  then
    DM.Ado439.Parameters.ParamByName('v2').Value :=1
   else
    DM.Ado439.parameters.ParamByName('v2').Value :=9;
   if not Checkbox3.Checked  then
    DM.Ado439.Parameters.ParamByName('v3').Value :=2
   else
    DM.Ado439.parameters.ParamByName('v3').Value :=9;
   if not Checkbox4.Checked  then
    DM.Ado439.Parameters.ParamByName('v4').Value :=3
   else
    DM.Ado439.parameters.ParamByName('v4').Value :=9;
   if not Checkbox5.Checked  then
    DM.Ado439.Parameters.ParamByName('v5').Value :=4
   else
    DM.Ado439.parameters.ParamByName('v5').Value :=9;
end;

procedure TfrmTrackMain.item_click(sender: TObject);
var i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
    begin
      for i := 0 to DBGridEh1.FieldCount - 1 do
      if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
      begin
        DBGridEh1.Columns[i].Visible := true ;
        break ;
      end ;
    end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := false ;
      break ;
    end ;
  end ;
end;

procedure TfrmTrackMain.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTrackMain.FormShow(Sender: TObject);
var i:Integer;
    item:TMenuItem;
begin
  sSQLTxt:=dm.Ado439.SQL.Text;

  EndDate:=getsystem_date(DM.tmp,1);
  StartDate:=EndDate-30;

//  BitBtn2Click(nil);       //未找末主表前，不能刷新
  dm.Ado439.Close;
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    DM.Ado439.SQL.Text:=sSQLTxt+' and (data0439.date_sailing >='+quotedstr(formatdatetime('YYYY-MM-DD',StartDate))+')'+
    ' and (data0439.date_sailing <='+quotedstr(formatdatetime('YYYY-MM-DD',EndDate))+')'+
    ' and data0439.customer_ptr in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+')';
  end
  else
  begin
    DM.Ado439.SQL.Text:=sSQLTxt+' and (data0439.date_sailing >='+quotedstr(formatdatetime('YYYY-MM-DD',StartDate))+')'+
    ' and (data0439.date_sailing <='+quotedstr(formatdatetime('YYYY-MM-DD',EndDate))+')'+ ' ';
  end;
  if (strtoint(vprev)=1) then
  begin
    CheckBox1.Checked:=True;
    CheckBox2.Checked:=True;
    CheckBox3.Checked:=True;
    CheckBox4.Checked:=True;
    CheckBox5.Checked:=True;
  end;
  if (strtoint(vprev)=3) then
  begin
    CheckBox1.Checked:=True;
    CheckBox2.Checked:=True;
    CheckBox3.Checked:=false;
    CheckBox4.Checked:=false;
    CheckBox5.Checked:=false;
  end;
  if (strtoint(vprev)=2) then
  begin
    CheckBox1.Checked:=True;
    CheckBox2.Checked:=True;
    CheckBox3.Checked:=True;
    CheckBox4.Checked:=True;
    CheckBox5.Checked:=false;
  end;
  if (strtoint(vprev)=4) then
  begin
    CheckBox1.Checked:=True;
    CheckBox2.Checked:=True;
    CheckBox3.Checked:=True;
    CheckBox4.Checked:=True;
    CheckBox5.Checked:=True;
  end;
  CheckBox6.Checked:=False;
  checkvar();
  DM.Ado439.Open;
  CDS.Data:=DSP.Data;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[1] ;
  PreColumn.Title.Color := clred ;

  for i := 1 to DBGridEh1.Columns.Count do
  begin
   item := TmenuItem.Create(self) ;
   item.Caption := DBGridEh1.Columns[i - 1].Title.Caption ;
   if DBGridEh1.Columns[i - 1].Visible then
    item.Checked := true ;
   item.OnClick := item_click ;
   PopupMenu2.Items.Add(item) ;
  end;

end;

procedure TfrmTrackMain.CDSAfterScroll(DataSet: TDataSet);
begin
  DM.Ado64.Close;
  DM.Ado64.Parameters.ParamByName('Rkey439').Value:=DataSet.FieldValues['Rkey'];
  DM.Ado64.Open;
end;

procedure TfrmTrackMain.PopupMenu1Popup(Sender: TObject);
var iSTATUS:Integer;
begin
  iSTATUS:=CDS.fieldBYName('iStatus').AsInteger;
  N1.Enabled:=(vprev='3') and (iSTATUS=0);
  N2.Enabled:=(vprev='2') and ((iSTATUS=0)or(iSTATUS=1));
  N3.Enabled:=(vprev='2') and (iSTATUS=2);
  N4.Enabled:=(vprev='4') and ((iSTATUS=0) or (iSTATUS=1) or (iSTATUS=2) or (iSTATUS=3));
  N5.Enabled:=(vprev='3') and (iSTATUS=1);
  N6.Enabled:=(vprev='2') and (iSTATUS=2);
  N7.Enabled:=(vprev='2') and (iSTATUS=3);
  N8.Enabled:=(vprev='4') and (iSTATUS=4);
end;

procedure TfrmTrackMain.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
  self.Caption:=application.Title;
{ 
  rkey73:='2525';
  user_ptr:='2998';
  vprev:='2';
  }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TfrmTrackMain.Edit1Change(Sender: TObject);
begin
  with CDS do
  if trim(Edit1.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
    Filter:=precolumn.FieldName+' like ''%'+trim(edit1.text)+'%''';
  end
  else
    Filtered := False;
end;

procedure TfrmTrackMain.CDSFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Assigned(Edit1) then
  if Trim(Edit1.Text) <>'' then
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(preColumn.FieldName).AsString),UpperCase(Edit1.Text) ) ;
end;

procedure TfrmTrackMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
//  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
//  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
//  begin
//    column.Title.SortMarker:=smUpEh;
//  end
//  else
//  begin
//    column.Title.SortMarker:=smDownEh;
//    CDS.IndexFieldNames:=Column.FieldName;
//  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
   edit1.SetFocus;
end;

procedure TfrmTrackMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (CDS.RecNo=CDS.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.Ado439.SQL.Text);
end;

procedure TfrmTrackMain.N1Click(Sender: TObject);
var iNo,itmp:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  itmp:=0;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('iStatus').AsInteger=0)) then
    begin
        itmp:=itmp+1;
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update data0439 set iStatus=1,SALES_REP_PTR='+user_ptr
        +',SALES_REP_Date='''+formatdatetime('yyyy-MM-dd hh:mm:ss',getsystem_date(dm.ADOQuery1,0))+''' where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+'''';
        dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=False;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if (itmp>0) then CDS.RecNo:=iNo;
end;

procedure TfrmTrackMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if CDS.FieldByName('iStatus').Value = 1 then
     DBGridEh1.Canvas.Font.Color := clPurple
  else if CDS.FieldByName('iStatus').Value = 2 then
     DBGridEh1.Canvas.Font.Color := clBlue //cllime
  else if CDS.FieldByName('iStatus').Value = 3 then
     DBGridEh1.Canvas.Font.Color := clfuchsia
  else if CDS.FieldByName('iStatus').Value = 4 then
     DBGridEh1.Canvas.Font.Color := clGreen;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmTrackMain.BitBtn2Click(Sender: TObject);
begin
  dm.Ado439.Close;
  checkvar();
  DM.Ado439.Open;
  CDS.Data:=DSP.Data;
  if (CheckBox6.Checked) then CheckBox6.Checked:=False;
  CDS.Filtered:=True;
  Edit1Change(Sender);
end;

procedure TfrmTrackMain.N2Click(Sender: TObject);
var iNo,itmp:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  itmp:=0;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and ((CDS.FieldByName('iStatus').AsInteger=0) or (CDS.FieldByName('iStatus').AsInteger=1)))  then
    begin
        itmp:=itmp+1;
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update data0439 set iStatus=2,depotAccept_PTR='+user_ptr
        +',depotAccept_Date='''+formatdatetime('yyyy-MM-dd hh:mm:ss',getsystem_date(dm.ADOQuery1,0))
        +''',depotAccept_Remark='''+CDS.fieldBYName('depotAccept_Remark').AsString
        +''' where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+'''';
        dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=False;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if (itmp>0) then CDS.RecNo:=iNo;
end;

procedure TfrmTrackMain.N3Click(Sender: TObject);
var iNo,itmp:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  itmp:=0;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('iStatus').AsInteger=2)) then
    begin
        itmp:=itmp+1;
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update data0439 set iStatus=3,depotSubmit_PTR='+user_ptr
        +',depotSubmit_Date='''+formatdatetime('yyyy-MM-dd hh:mm:ss',getsystem_date(dm.ADOQuery1,0))
        +''' where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+'''';
        dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=false;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if (itmp>0) then CDS.RecNo:=iNo;
end;

procedure TfrmTrackMain.N4Click(Sender: TObject);
var iNo,itmp:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  itmp:=0;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and ((CDS.FieldByName('iStatus').AsInteger=0) or (CDS.FieldByName('iStatus').AsInteger=1) or (CDS.FieldByName('iStatus').AsInteger=2) or (CDS.FieldByName('iStatus').AsInteger=3))) then
    begin
        itmp:=itmp+1;
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update data0439 set iStatus=4,Finance_PTR='+user_ptr
        +',Finance_Date='''+formatdatetime('yyyy-MM-dd hh:mm:ss',getsystem_date(dm.ADOQuery1,0))
        +''',Finance_Remark='''+CDS.fieldBYName('Finance_Remark').AsString
        +''' where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+'''';
        dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=false;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if (itmp>0) then CDS.RecNo:=iNo;
end;

procedure TfrmTrackMain.BitBtn4Click(Sender: TObject);
begin
  PopupMenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmTrackMain.DBGridEh1CellClick(Column: TColumnEh);
begin
//  if (vprev='2') and (DBGridEh1.Col=18)then
//  begin
//    CDS.FieldByName('depotAccept_Remark').ReadOnly:=False;
//    CDS.FieldByName('Finance_Remark').ReadOnly:=True;
//  end else
  if (vprev='4') and (DBGridEh1.Col=23)then
  begin
    CDS.FieldByName('depotAccept_Remark').ReadOnly:=True;
    CDS.FieldByName('Finance_Remark').ReadOnly:=False;
  end else
  begin
    CDS.FieldByName('depotAccept_Remark').ReadOnly:=True;
    CDS.FieldByName('Finance_Remark').ReadOnly:=True;
  end;
end;

procedure TfrmTrackMain.CheckBox1Click(Sender: TObject);
var iSTATUS,i:Integer;
begin
  BitBtn2Click(nil);
  iSTATUS:=0;
  for i:=1 to 5 do
  begin
    if TCheckBox(FindComponent('checkBox'+inttostr(i))).Checked then iSTATUS:=iSTATUS+1;
  end;
  if (iSTATUS>=2) then CheckBox6.Enabled:=False else CheckBox6.Enabled:=True;
end;

procedure TfrmTrackMain.CheckBox6Click(Sender: TObject);
begin
  CDS.DisableControls;
  screen.Cursor:=crHourGlass;
  CDS.First;
  while not CDS.Eof do
  begin
    if (CheckBox1.Checked) and (CheckBox6.Checked) then
    begin
      CDS.Edit;
      CDS.FieldByName('sel').AsBoolean:=true;
      CDS.Post;
    end else
    if (CheckBox2.Checked) and (CheckBox6.Checked) then
    begin
      CDS.Edit;
      CDS.FieldByName('sel').AsBoolean:=true;
      CDS.Post;
    end else
    if (CheckBox3.Checked) and (CheckBox6.Checked) then
    begin
      CDS.Edit;
      CDS.FieldByName('sel').AsBoolean:=true;
      CDS.Post;
    end else
    if (CheckBox4.Checked) and (CheckBox6.Checked) then
    begin
      CDS.Edit;
      CDS.FieldByName('sel').AsBoolean:=true;
      CDS.Post;
    end else
    if (CheckBox5.Checked) and (CheckBox6.Checked) then
    begin
      CDS.Edit;
      CDS.FieldByName('sel').AsBoolean:=true;
      CDS.Post;
    end
    else
    begin
      CDS.Edit;
      CDS.FieldByName('sel').AsBoolean:=false;
      CDS.Post;
    end ;
    CDS.Next;
  end;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
end;

procedure TfrmTrackMain.N5Click(Sender: TObject);
var iNo,itmp:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  itmp:=0;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('iStatus').AsInteger=1)) then
    begin
        itmp:=itmp+1;
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update data0439 set iStatus=0,SALES_REP_PTR=null,SALES_REP_Date=null where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+'''';
        dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=false;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if (itmp>0) then CDS.RecNo:=iNo;
end;

procedure TfrmTrackMain.N6Click(Sender: TObject);
var iNo,itmp:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then //仓库接收取消
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  itmp:=0;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('iStatus').AsInteger=2)) then
    begin
        itmp:=itmp+1;
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        if (CDS.FieldByName('SALES_REP_Date').Value<>Null) then
          dm.tmp.SQL.Text:='update data0439 set iStatus=1,depotAccept_PTR=null,depotAccept_Date=null,depotAccept_Remark=null where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+''''
        else
          dm.tmp.SQL.Text:='update data0439 set iStatus=0,depotAccept_PTR=null,depotAccept_Date=null,depotAccept_Remark=null where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+'''';
        dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=false;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if (itmp>0) then CDS.RecNo:=iNo;
end;

procedure TfrmTrackMain.N7Click(Sender: TObject);
var iNo,itmp:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then //仓库提交取消
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  itmp:=0;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('iStatus').AsInteger=3)) then
    begin
        itmp:=itmp+1;
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update data0439 set iStatus=2,depotSubmit_PTR=Null,depotSubmit_Date=Null where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+'''';
        dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=false;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if (itmp>0) then CDS.RecNo:=iNo;
end;

procedure TfrmTrackMain.N8Click(Sender: TObject);
var iNo,itmp:Integer;
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选..');
    abort;
  end;
  if CDS.FieldByName('sel').AsBoolean then iNo:=CDS.RecNo;
  cds.DisableControls;
  CDS.Filter:='sel=1';
  CDS.Filtered:=True;
  CDS.First;
  screen.Cursor:=crHourGlass;
  itmp:=0;
  while not CDS.Eof do
  begin
    if ((CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('iStatus').AsInteger=4)) then
    begin
        itmp:=itmp+1;
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        if (CDS.FieldByName('depotSubmit_Date').Value<>Null) then
        dm.tmp.SQL.Text:='update data0439 set iStatus=3,Finance_PTR=Null,Finance_Date=Null,Finance_Remark=Null where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+''''
        else if (CDS.FieldByName('depotAccept_Date').Value<>Null) then
        dm.tmp.SQL.Text:='update data0439 set iStatus=2,Finance_PTR=Null,Finance_Date=Null,Finance_Remark=Null where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+''''
        else if (CDS.FieldByName('SALES_REP_Date').Value<>Null) then
        dm.tmp.SQL.Text:='update data0439 set iStatus=1,Finance_PTR=Null,Finance_Date=Null,Finance_Remark=Null where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+''''
        else
        dm.tmp.SQL.Text:='update data0439 set iStatus=0,Finance_PTR=Null,Finance_Date=Null,Finance_Remark=Null where delivery_no='''+CDS.fieldBYName('delivery_no').AsString+'''';
        dm.tmp.ExecSQL;
    end;
    CDS.Next;
  end;
  CDS.Filtered:=false;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
  BitBtn2Click(nil);
  if (itmp>0) then CDS.RecNo:=iNo;
end;

procedure TfrmTrackMain.BitBtn1Click(Sender: TObject);
var i,j,iNo:integer;
    strText,sTemp:string;
begin
  if StartDate > 100 then
    FrmQuery.DateTimePicker3.Date:= StartDate
  else
    FrmQuery.DateTimePicker3.Date:=getsystem_date(DM.tmp,1)-1;
  if EndDate > 100 then
    FrmQuery.DateTimePicker5.Date:= EndDate
  else
    FrmQuery.DateTimePicker5.Date:=getsystem_date(DM.tmp,1);
  FrmQuery.ListBox3.ItemIndex := FrmQuery.iItem;
  Sqlstr:='';
  if FrmQuery.ShowModal=mrok then
  begin
    screen.Cursor:=crHourGlass;
    iNo:=0;
    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      DM.Ado439.DisableControls;
      DM.Ado439.Close;
      DM.Ado439.SQL.Clear;
      if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
      begin
        DM.Ado439.SQL.Text:=sSQLTxt+' '+Sqlstr+' and (data0439.date_sailing >='+quotedstr(formatdatetime('YYYY-MM-DD',FrmQuery.DateTimePicker3.Date))+')'+
        ' and (data0439.date_sailing <='+quotedstr(formatdatetime('YYYY-MM-DD',FrmQuery.DateTimePicker5.Date))+')'+
        ' and data0439.customer_ptr in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+')';
      end else
      begin
        DM.Ado439.SQL.Text:=sSQLTxt+' '+Sqlstr+' and (data0439.date_sailing >='+quotedstr(formatdatetime('YYYY-MM-DD',FrmQuery.DateTimePicker3.Date))+')'+
        ' and (data0439.date_sailing <='+quotedstr(formatdatetime('YYYY-MM-DD',FrmQuery.DateTimePicker5.Date))+')'+ ' ';
      end;
      StartDate:=FrmQuery.DateTimePicker3.Date;
      EndDate:=FrmQuery.DateTimePicker5.Date;
      checkvar();
      DM.Ado439.Prepared;
      DM.Ado439.Open;
      CDS.Data:=DSP.Data;
    finally
      DM.Ado439.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

procedure TfrmTrackMain.BitBtn3Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption) ;
end;

procedure TfrmTrackMain.BitBtn6Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh2,self.Caption) ;
end;

procedure TfrmTrackMain.Button1Click(Sender: TObject);
begin
  frmExplanation:=TfrmExplanation.Create(Self);
  frmExplanation.ShowModal;
  frmExplanation.Free;
end;

end.
