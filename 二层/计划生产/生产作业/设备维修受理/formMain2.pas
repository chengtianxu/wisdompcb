unit formMain2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, Buttons, DB, ADODB, Grids, DBGridEh,
  Menus,DBGridEhImpExp, ExtCtrls; //DBGridEhImpExp  DBGRIDEH导出用

type
  TfrmMain2 = class(TForm)
    ToolBar1: TToolBar;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    BitBtn1: TBitBtn;
    SaveDialog1: TSaveDialog;
    ADOQueryCopy: TADOQuery;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1DSDesigner3: TStringField;
    ADOQuery1DSDesigner4: TStringField;
    ADOQuery1DSDesigner5: TStringField;
    ADOQuery1DSDesigner7: TStringField;
    ADOQuery1DSDesigner8: TStringField;
    ADOQuery1DSDesigner9: TStringField;
    ADOQuery1DSDesigner10: TStringField;
    ADOQuery1DSDesigner11: TStringField;
    ADOQuery1DSDesigner12: TDateTimeField;
    ADOQuery1DSDesigner13: TStringField;
    ADOQuery1DSDesigner14: TStringField;
    ADOQuery1DSDesigner15: TStringField;
    ADOQuery1DSDesigner16: TDateTimeField;
    ADOQuery1DSDesigner17: TStringField;
    ADOQuery1DSDesigner18: TDateTimeField;
    ADOQuery1DSDesigner19: TStringField;
    ADOQuery1DSDesigner20: TStringField;
    ADOQuery1DSDesigner21: TBCDField;
    ADOQuery1DSDesigner22: TDateTimeField;
    ADOQuery1DSDesigner23: TStringField;
    ADOQuery1DSDesigner24: TStringField;
    ADOQuery1DSDesigner25: TDateTimeField;
    ADOQuery1DSDesigner26: TDateTimeField;
    ADOQuery1DSDesigner27: TStringField;
    ADOQuery1DSDesigner28: TBCDField;
    ADOQuery1DSDesigner29: TBCDField;
    ADOQuery1DSDesigner30: TBCDField;
    ADOQuery1DSDesigner31: TBCDField;
    ADOQuery1DSDesigner32: TStringField;
    ADOQuery1DSDesigner33: TStringField;
    StatusBar1: TStatusBar;
    ADOQuery1DSDesigner34: TStringField;
    ADOQuery1DSDesigner6: TStringField;
    ADOQuery1DSDesigner35: TBCDField;
    ADOQuery1DSDesigner36: TBooleanField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ADOQuery1DSDesigner33GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain2: TfrmMain2;


implementation

uses damo, formFindcds,common, PublicFunc, ColsDisplaySet_unt;

{$R *.dfm}

procedure TfrmMain2.BitBtn2Click(Sender: TObject);
var
  StrWhere :string;
  i:Integer;
begin
  begin
    SetLength(Query_Info,8);
    Query_Info[0]:=TQueryInfo.Create();
    with Query_Info[0] do
    begin
      L_ListDataSetName       :=DM.cds0005;
      L_DropdownColumn        :='雇员';   //雇员代码
      L_ListResultField       :='EMPLOYEE_NAME';
    end;
    Query_Info[1]:=TQueryInfo.Create();
    with Query_Info[1] do
    begin
      L_ListDataSetName       :=DM.AQ0034;
      L_DropdownColumn        :='部门名称';   //雇员代码
      L_ListResultField       :='DEPT_NAME';
    end;
    Query_Info[2]:=TQueryInfo.Create();
    with Query_Info[2] do
    begin
      L_ListDataSetName       :=DM.cds0005;
      L_DropdownColumn        :='受理人';   //雇员代码
      L_ListResultField       :='EMPLOYEE_NAME';
    end;
    Query_Info[3]:=TQueryInfo.Create();
    with Query_Info[3] do
    begin
      L_ListDataSetName       :=DM.cds0005;
      L_DropdownColumn        :='完工人员';   //雇员代码
      L_ListResultField       :='EMPLOYEE_NAME';
    end;
    Query_Info[4]:=TQueryInfo.Create();
    with Query_Info[4] do
    begin
      L_AddPickList:=varArrayOF(['未提交','待受理','已受理','已完工','已验收','被退回','已暂停','验收退回']);
      L_DropdownColumn        :='工作单状态';   //雇员代码
    end;
    Query_Info[5]:=TQueryInfo.Create();
    with Query_Info[5] do
    begin
      L_ListDataSetName       :=DM.aq0015;
      L_DropdownColumn        :='工厂';   //雇员代码
      L_ListResultField       :='abbr_name';
    end;
    Query_Info[6]:=TQueryInfo.Create();
    with Query_Info[6] do
    begin
      L_ListDataSetName       :=DM.cds0005;
      L_DropdownColumn        :='输入人员';   //雇员代码
      L_ListResultField       :='EMPLOYEE_NAME';
    end;
    Query_Info[7]:=TQueryInfo.Create();
    with Query_Info[7] do
    begin
      L_ListDataSetName       :=DM.QryD840;
      L_DropdownColumn        :='责任小组';
      L_ListResultField       :='Location';
    end;
  end;

  if ShowfrmFindcds(Self,ADOQuery1,StrWhere,[],[],[],[],[],[],[],[],500) then
  begin
    with ADOQuery1  do
    begin
      Close;
      SQL.Text:=ADOQueryCopy.SQL.Text;
      SQL.Add(StrWhere)  ;
      Open;
    end;
  end;
  for I:=0 to  High(Query_Info ) do
  FreeAndNil(Query_Info[I]);
end;

procedure TfrmMain2.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADOQuery1.SQL.Text);
end;

procedure TfrmMain2.BitBtn1Click(Sender: TObject);
var
  ExpClass:TDBGridEhExportClass  ;
  Ext:String;
  FFileName:string;
begin
  SaveDialog1.FileName := Self.Caption;
  if SaveDialog1.Execute then
  begin
    case SaveDialog1.FilterIndex of
      1: begin ExpClass := TDBGridEhExportAsXLS;  Ext := 'xls'; end;
      2: begin ExpClass := TDBGridEhExportAsCSV;  Ext := 'csv'; end;
      3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
      4: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
    else
      ExpClass := nil; Ext := '';
    end;

    if ExpClass <> nil then
    begin
      if UpperCase(Copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-2,3)) <>
          UpperCase(Ext) then
        FFileName := SaveDialog1.FileName + '.' + Ext;

      if   FileExists(FFileName)   then
      if messagedlg('文件“'+FFileName+'”已经存在,你要覆盖吗?',mtconfirmation,[mbyes,mbno],0)=mrNo then
        Exit;

      SaveDBGridEhToExportFile(ExpClass,DBGridEh1,FFileName,True);    //导出全部数据。
    end;
  end;

end;

procedure TfrmMain2.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := $00FFC4C4;
end;

procedure TfrmMain2.ADOQuery1DSDesigner33GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FloatToStr(round(Sender.AsFloat * 10000)/100) + '%';
end;

procedure TfrmMain2.DBGridEh1TitleClick(Column: TColumnEh);
begin
  with Column.Grid.DataSource.DataSet as TCustomADODataSet do
  begin
    if FieldByName(Column.FieldName).FieldKind in[ fkCalculated,fkLookup]  then
      exit ;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      Sort:=Column.FieldName;
    end
    else
    begin
      column.Title.SortMarker:=smDownEh;
      Sort:=Column.FieldName+' DESC';
    end;
  end;
end;

procedure TfrmMain2.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  with   DataSet do
  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount)
end;

procedure TfrmMain2.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
end;

procedure TfrmMain2.N1Click(Sender: TObject);
begin
   show_ColsDisplaySet_frm (Self,DBGridEh1,StrToInt(rkey73)) ;
end;

procedure TfrmMain2.FormShow(Sender: TObject);
begin
  ResetGridColumns(Self,DM.ADOConnection,StrToInt(rkey73),StrToInt(vprev)=2);
end;

procedure TfrmMain2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveColsInfo(Self,StrToInt(rkey73));
end;

procedure TfrmMain2.N2Click(Sender: TObject);
begin
  SetFrozenField(Self,DBGridEh1,DBGridEh1.SelectedField.FieldName,StrToInt(rkey73));
end;

procedure TfrmMain2.N3Click(Sender: TObject);
begin
  CancelFrozenField(Self,DBGridEh1,StrToInt(rkey73));
end;

end.
