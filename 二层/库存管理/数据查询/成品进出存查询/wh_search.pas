unit wh_search;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls,DBClient,DB, Provider, ADODB;
  
type
  TForm_Wh = class(TForm)
    Panel1: TPanel;
    labelKey: TLabel;
    CheckBox1: TCheckBox;
    edtKey: TEdit;
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    DBGridEh1: TDBGridEh;
    dspPickWorkShop: TDataSetProvider;
    adsPickWorkShop: TADODataSet;
    cdsPickWorkShop: TClientDataSet;
    dsPickWorkShop: TDataSource;
    adsPickWorkShopIsSelected: TBooleanField;
    adsPickWorkShoprKey: TIntegerField;
    adsPickWorkShopCode: TStringField;
    adsPickWorkShopLocation: TStringField;
    procedure adsPickWorkShopAfterOpen(DataSet: TDataSet);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtKeyChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Enter(rKey:integer);
  end;

var
  Form_Wh: TForm_Wh;

implementation

uses main,MyClass,common;

{$R *.dfm}

procedure TForm_Wh.Enter(rKey: integer);
begin
  ReSet_Sort(DBGridEh1);
  cdsPickWorkShop.Filter:='';
  adsPickWorkShop.Filtered:=false;
  adsPickWorkShop.Close;
  adsPickWorkShop.Open;
  MyDataClass.UpdateValueToField(cdsPickWorkShop,checkbox1.Checked,'IsSelected');
  cdsPickWorkShop.Locate('rKey',rKey,[]);
end;

procedure TForm_Wh.adsPickWorkShopAfterOpen(DataSet: TDataSet);
begin
 cdsPickWorkShop.Data := dspPickWorkShop.Data;
end;

procedure TForm_Wh.DBGridEh1CellClick(Column: TColumnEh);
begin
  edtKey.Enabled:= not cdsPickWorkShop.IsEmpty;
  if cdsPickWorkShop.IsEmpty then abort;
  if trim(Column.Title.Caption)='选中' then
    labelKey.Caption :='搜索：'
  else labelKey.Caption :='搜索(' +Column.Title.Caption+')：';
end;

procedure TForm_Wh.DBGridEh1DblClick(Sender: TObject);
begin
  Modalresult := mrok;
end;

procedure TForm_Wh.DBGridEh1TitleClick(Column: TColumnEh);
var OldIndex:string;
begin
  if (Column.Grid.DataSource=nil) or (Column.Grid.DataSource.DataSet=nil) or (not Column.Grid.DataSource.DataSet.Active) then
    Exit;
  OldIndex:=TClientDataSet(Column.Field.DataSet).IndexName;

  if OldIndex<>'' then
  begin
    TClientDataSet(Column.Field.DataSet).IndexName:='';
    TClientDataSet(Column.Field.DataSet).DeleteIndex(OldIndex);
  end;
  if Column.Title.SortMarker = smDownEh then
  begin
    TClientDataSet(Column.Field.DataSet).AddIndex('px',Column.Field.FieldName,[ixPrimary]);
    TClientDataSet(Column.Field.DataSet).IndexName:='px';
    Column.Title.SortMarker := smUpEh;
  end
  else if Column.Title.SortMarker = smUpEh then
  begin
//      TClientDataSet(Column.Field.DataSet).DeleteIndex('px');
      Column.Title.SortMarker := smNoneEh;
  end
  else if Column.Title.SortMarker = smNoneEh then
  begin
    TClientDataSet(Column.Field.DataSet).AddIndex('px',Column.Field.FieldName,[ixDescending]);//已经是升序就按降序排列
    TClientDataSet(Column.Field.DataSet).IndexName:='px';
    Column.Title.SortMarker := smDownEh;
  end;{end case}
end;

procedure TForm_Wh.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 canclose:=true;
  if Modalresult = mrok then
  begin
    try
      cdsPickWorkShop.DisableControls;
      MyDataClass.Set_Filter('IsSelected=1',cdsPickWorkShop);
      if cdsPickWorkShop.IsEmpty then
      begin
        ShowMsg('请选择仓库',1);
        canclose:= false;
        cdsPickWorkShop.Filter:='';
        cdsPickWorkShop.Filtered := false;
        exit;
      end;
    finally
      cdsPickWorkShop.EnableControls;
    end;
  end;

end;

procedure TForm_Wh.edtKeyChange(Sender: TObject);
var tmpstr,sFilter:string;
DATASET:TClientDATASET;
begin
  if not cdsPickWorkShop.Active then abort;
  DataSet:=cdsPickWorkShop;
  tmpstr:= trim(edtKey.Text);
  if TmpStr='' then
    DataSet.Filtered:= false
  else
  begin
    if (DBGridEh1.SelectedField.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '%'+uppercase(TmpStr)+'%';
      DataSet.Filter := DBGridEh1.SelectedField.FieldName+' Like '+ QuotedStr(sFilter);
      DataSet.Filtered:= true;
    end
    else if DBGridEh1.SelectedField.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := DBGridEh1.SelectedField.FieldName+'>='+TmpStr;//DBGrid3.SelectedField.FieldName+'>='+TmpStr+' AND '+ DBGrid3.SelectedField.FieldName+'<'+IntToStr(Get_Filter_Of_Fixed_Int(StrToFloat(TmpStr)));
      DataSet.Filter := sFilter;
      DataSet.Filtered:= true;
    end
    else if DBGridEh1.SelectedField.DataType in [ftDate, ftDateTime] then
    begin
      if not IsDatetime(TmpStr) then exit;
      sFilter := '>='+QuotedStr(TmpStr);
      DataSet.Filter := DBGridEh1.SelectedField.FieldName + sFilter;
      DataSet.Filtered:= true;
    end;
  end;
end;

procedure TForm_Wh.edtKeyKeyPress(Sender: TObject; var Key: Char);
begin
  if DBGridEh1.SelectedField.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
//    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end
  else if  DBGridEh1.SelectedField.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end ;
end;

procedure TForm_Wh.CheckBox1Click(Sender: TObject);
begin
 MyDataClass.UpdateValueToField(cdsPickWorkShop,checkbox1.Checked,'IsSelected');
end;

end.
