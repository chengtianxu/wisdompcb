unit Parmeter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls,DBClient,DB, Provider, ADODB;

type
  TFrm_Parmeter = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    labelKey: TLabel;
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    CheckBox1: TCheckBox;
    edtKey: TEdit;
    ads278: TADODataSet;
    DataSource1: TDataSource;
    ads278clientds: TClientDataSet;
    ads278provide: TDataSetProvider;
    ads278IsSelected: TBooleanField;
    ads278PARAMETER_NAME: TStringField;
    ads278PARAMETER_DESC: TStringField;
    ads278UNIT_NAME: TStringField;
    ads278rkey: TIntegerField;
    ads278clientdsIsSelected: TBooleanField;
    ads278clientdsPARAMETER_NAME: TStringField;
    ads278clientdsPARAMETER_DESC: TStringField;
    ads278clientdsUNIT_NAME: TStringField;
    ads278clientdsrkey: TIntegerField;
    ads278DATA_TYPE: TStringField;
    ads278CATEGORY_PTR: TStringField;
    ads278clientdsDATA_TYPE: TStringField;
    ads278clientdsCATEGORY_PTR: TStringField;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edtKeyChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Enter(rKey:integer);
  end;

var
  Frm_Parmeter: TFrm_Parmeter;

implementation
uses demo,MyClass,common;
{$R *.dfm}

{ TfrmPick_WorkShop }

procedure TFrm_Parmeter.Enter(rKey: integer);
begin
  ReSet_Sort(DBGridEh1);

  ads278clientds.Filter:='';
  ads278clientds.Filtered:=false;

  ads278clientds.Close;
  ads278clientds.Open;

  MyDataClass.UpdateValueToField(ads278clientds,checkbox1.Checked,'IsSelected');
  ads278clientds.Locate('rKey',rKey,[]);
end;

procedure TFrm_Parmeter.DBGridEh1DblClick(Sender: TObject);
begin
  Modalresult := mrok;
end;

procedure TFrm_Parmeter.CheckBox1Click(Sender: TObject);
begin
  MyDataClass.UpdateValueToField(ads278clientds,checkbox1.Checked,'IsSelected');
end;

procedure TFrm_Parmeter.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 canclose:=true;
  if Modalresult = mrok then
  begin
    try
      ads278clientds.DisableControls;
      MyDataClass.Set_Filter('IsSelected=1',ads278clientds);
      if ads278clientds.IsEmpty then
      begin
        ShowMsg('请添加用户',1);
        canclose:= false;
        ads278clientds.Filter:='';
        ads278clientds.Filtered := false;
        exit;
      end;
    finally
      ads278clientds.EnableControls;
    end;
  end;
end;

procedure TFrm_Parmeter.DBGridEh1CellClick(Column: TColumnEh);
begin
  edtKey.Enabled:= not ads278clientds.IsEmpty;
  if ads278clientds.IsEmpty then abort;
  if trim(Column.Title.Caption)='选中' then
    labelKey.Caption :='搜索：'
  else
   labelKey.Caption :='搜索(' +Column.Title.Caption+')：';
end;

procedure TFrm_Parmeter.DBGridEh1TitleClick(Column: TColumnEh);
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

procedure TFrm_Parmeter.edtKeyChange(Sender: TObject);
var tmpstr,sFilter:string;
    DATASET:TClientDATASET;
begin
  if not ads278clientds.Active then abort;
  DataSet:=ads278clientds;
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

procedure TFrm_Parmeter.edtKeyKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrm_Parmeter.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ads278.CommandText);
end;

end.
