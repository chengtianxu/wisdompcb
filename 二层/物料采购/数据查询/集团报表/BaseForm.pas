unit BaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Menus, DB, ADODB,
  ComCtrls, DBClient;

type
  TfrmBaseForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnExit: TBitBtn;
    btnExcel: TBitBtn;
    btnColumn: TBitBtn;
    btnQuery: TBitBtn;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    pmColumn: TPopupMenu;
    dsQuery: TDataSource;
    aqQuery: TADOQuery;
    lblFilter: TLabel;
    edtFilter: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnColumnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    Field_Name: String;
    PreColumn: TColumnEh;
    procedure Item_Click(Sender: TObject);
    procedure InitForm(Title,S: string); virtual;
  end;

var
  frmBaseForm: TfrmBaseForm;

implementation

uses condition, common, main;

{$R *.dfm}

procedure TfrmBaseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= cafree;
end;

procedure TfrmBaseForm.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaseForm.btnExcelClick(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.RecordCount>0 then
    Export_dbGridEH_to_Excel(DBGridEh1, self.Caption);
end;

procedure TfrmBaseForm.btnColumnClick(Sender: TObject);
begin
  pmColumn.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmBaseForm.Item_Click(Sender: TObject);
var
  i:byte;
begin
  (sender as TMenuItem).Checked := not ((sender as TMenuItem).Checked);
  if (sender as TMenuItem).Checked then
  begin
    for i:= 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (sender as TMenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible:= True;
      break;
    end;
  end
  else
  begin
    for i:= 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (sender as TMenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible:= False;
      break;
    end;
  end;
end;

procedure TfrmBaseForm.InitForm(Title,S: string);
  procedure SetColumn;
  var
    i: Byte;
    item: TMenuItem;
  begin
    for i:= 1 to DBGridEh1.FieldCount do
    begin
      item:= TMenuItem.Create(self);
      item.Caption:= DBGridEh1.Columns[i-1].Title.Caption;
      if DBGridEh1.Columns[i-1].Visible then item.Checked:= true;
      item.OnClick:= Item_Click;
      self.pmColumn.Items.Add(item);
    end;
  end;
  var n: integer;
begin
  Self.Caption:= Title;
  with aqQuery do
  begin
    DBGridEh1.DataSource.DataSet.Close;
    //SQL.Clear;
    //SQL.Add(S);
    for n:=0 to Parameters.Count-1 do
     Parameters[n].Value:= '';
    DBGridEh1.DataSource.DataSet.Open;  //有可能不是aqQuery.Open
  end;
  SetColumn;
  lblFilter.Caption:= (DBGridEh1.Columns[0].Title as TColumnTitleEh).Caption;
  DBGridEh1.Columns[0].Title.Color:= clred;
end;

procedure TfrmBaseForm.FormShow(Sender: TObject);
begin
  Self.WindowState:= wsMaximized;
  Field_Name:= DBGridEh1.Columns[0].FieldName;
  PreColumn:= DBGridEh1.Columns[0];
end;

procedure TfrmBaseForm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Byte;
  Param: string;
begin
  for i:= 0 to aqQuery.Parameters.Count-1 do
  begin
    if i = 0 then
      Param:= '参数'+IntToStr(i+1)+':'+VarToStr(aqQuery.Parameters[i].Value)+#13
    else
    begin
      Param:= Param+'参数'+IntToStr(i+1)+':'+VarToStr(aqQuery.Parameters[i].Value);
      if VarToStr(aqQuery.Parameters[i].Value) = '' then Param:= Param+#13;
    end;
  end;
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg(aqQuery.SQL.Text+#13+Param, mtInformation, [mbOK], 0);
end;

procedure TfrmBaseForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.Active then
  begin
    if TDBGridEh(Sender).DataSource.DataSet is TADOQuery then
    begin
      if Column.Title.SortMarker = smDownEh then  //排序
        TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Sort:= Column.FieldName
      else
        TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Sort:= Column.FieldName + ' DESC';
    end;
    if TDBGridEh(Sender).DataSource.DataSet is TClientDataSet then
    begin
      if Column.Title.SortMarker = smDownEh then  //排序
      begin
        if TClientDataSet(TDBGridEh(Sender).DataSource.DataSet).IndexName<>'' then
          TClientDataSet(TDBGridEh(Sender).DataSource.DataSet).DeleteIndex(TClientDataSet(TDBGridEh(Sender).DataSource.DataSet).IndexName);
        TClientDataSet(TDBGridEh(Sender).DataSource.DataSet).AddIndex('PX',Column.FieldName,[ixPrimary]);
      end
      else
      begin
        if TClientDataSet(TDBGridEh(Sender).DataSource.DataSet).IndexName<>'' then
          TClientDataSet(TDBGridEh(Sender).DataSource.DataSet).DeleteIndex(TClientDataSet(TDBGridEh(Sender).DataSource.DataSet).IndexName);
        TClientDataSet(TDBGridEh(Sender).DataSource.DataSet).AddIndex('PX',Column.FieldName,[ixDescending]);
      end;
      TClientDataSet(TDBGridEh(Sender).DataSource.DataSet).IndexName:= 'PX';
    end;
  end;
end;

procedure TfrmBaseForm.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.Active then
  begin
    if Field_Name <> Column.FieldName then
    begin
      Field_Name:= Column.FieldName;
      lblFilter.Caption:= Column.Title.Caption;
      edtFilter.Text:= '' ;
      edtFilter.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end
    else
    if Field_Name = Column.FieldName then
    begin
      edtFilter.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end;
  end;
end;

procedure TfrmBaseForm.edtFilterChange(Sender: TObject);
var
  S: String;
begin
  IF DBGridEh1.DataSource.DataSet.Active Then
  begin
    DBGridEh1.DataSource.DataSet.Filter := '';
    S:= '';
    if trim(edtFilter.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.Fields.FieldByName(Field_Name).DataType in [ftString, ftWideString] then
      begin
        if S = '' then
          S:= Field_Name + ' like ''%' + Trim(edtFilter.text) + '%'''
        else
          S:= S + ' and ' + Field_Name + ' like ''%' + trim(edtFilter.text) + '%''';
      end
      else
      if DBGridEh1.DataSource.DataSet.Fields.FieldByName(Field_Name).DataType in [ftSmallint, ftInteger, ftWord] then
      begin
        try
          StrToInt(edtFilter.Text);
          if S = '' then
            S:= Field_Name + ' = ' + trim(edtFilter.text)
          else
            S:= S + ' and ' + Field_Name+' = ' + trim(edtFilter.text);
        except
          ShowMessage('输入的内容不符，请输入数字！');
        end;
      end;
    end;
    DBGridEh1.DataSource.DataSet.Filter:= S;
  end;
end;

procedure TfrmBaseForm.btnQueryClick(Sender: TObject);
begin
//此处不能删除
end;

procedure TfrmBaseForm.FormActivate(Sender: TObject);
begin
//  Showmessage(Copy(Self.Name,Pos('frmReport',Self.Name)+9,Length(Self.Name)-Pos('frmReport',Self.Name)));
  frmMain.iTag:= StrToInt(Copy(Self.Name,Pos('frmReport',Self.Name)+9,Length(Self.Name)-Pos('frmReport',Self.Name)));
end;

end.
