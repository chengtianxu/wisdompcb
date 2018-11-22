unit Pick_WorkShop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls,DBClient,DB;

type
  TfrmPick_WorkShop = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    labelKey: TLabel;
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    edtKey: TEdit;
    CheckBox1: TCheckBox;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edtKeyChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Enter(rKey:integer);
    { Public declarations }
   
  end;

var
  frmPick_WorkShop: TfrmPick_WorkShop;

implementation
uses uDM,MyClass,common;
{$R *.dfm}

{ TfrmPick_WorkShop }

procedure TfrmPick_WorkShop.Enter(rKey: integer);
begin
  ReSet_Sort(DBGridEh1);
  dm.cdsPickWorkShop.Filter:='';
  dm.adsPickWorkShop.Filtered:=false;
  dm.adsPickWorkShop.Close;
  dm.adsPickWorkShop.Open;
  MyDataClass.UpdateValueToField(dm.cdsPickWorkShop,checkbox1.Checked,'IsSelected');
  dm.cdsPickWorkShop.Locate('rKey',rKey,[]);
end;

procedure TfrmPick_WorkShop.DBGridEh1DblClick(Sender: TObject);
begin
  Modalresult := mrok;
end;

procedure TfrmPick_WorkShop.CheckBox1Click(Sender: TObject);
begin
  MyDataClass.UpdateValueToField(dm.cdsPickWorkShop,checkbox1.Checked,'IsSelected');
end;

procedure TfrmPick_WorkShop.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=true;
  if Modalresult = mrok then
  begin
    try
      dm.cdsPickWorkShop.DisableControls;
      MyDataClass.Set_Filter('IsSelected=1',dm.cdsPickWorkShop);
      if dm.cdsPickWorkShop.IsEmpty then
      begin
        ShowMsg('请选择工序',1);
        canclose:= false;
        dm.cdsPickWorkShop.Filter:='';
        dm.cdsPickWorkShop.Filtered := false;
        exit;
      end;
    finally
      dm.cdsPickWorkShop.EnableControls;
    end;
  end;
end;

procedure TfrmPick_WorkShop.DBGridEh1CellClick(Column: TColumnEh);
begin
  edtKey.Enabled:= not dm.cdsPickWorkShop.IsEmpty;
  if dm.cdsPickWorkShop.IsEmpty then abort;
  if trim(Column.Title.Caption)='选中' then
    labelKey.Caption :='搜索：'
  else labelKey.Caption :='搜索(' +Column.Title.Caption+')：';
end;

procedure TfrmPick_WorkShop.DBGridEh1TitleClick(Column: TColumnEh);
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

procedure TfrmPick_WorkShop.edtKeyChange(Sender: TObject);
var tmpstr,sFilter:string;
DATASET:TClientDATASET;
begin
  if not dm.cdsPickWorkShop.Active then abort;
  DataSet:=dm.cdsPickWorkShop;
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

procedure TfrmPick_WorkShop.edtKeyKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmPick_WorkShop.FormShow(Sender: TObject);
begin
    { with dm.adsPickWorkShop do
     begin
     close;
     Parameters.ParamByName('RKEY25').Value.value:=dm.ADO0745RKEY25.value;
     Open;
     end;}
end;


end.
