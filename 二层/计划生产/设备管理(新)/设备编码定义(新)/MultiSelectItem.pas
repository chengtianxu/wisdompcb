unit MultiSelectItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ExtCtrls, DB, ADODB, Provider,
  DBClient;

type
  Tfrm_MultiSelectItem = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    ADS417_1: TADODataSet;
    DataSource1: TDataSource;
    ADS417_1selected: TBooleanField;
    ADS417_1RKEY: TAutoIncField;
    ADS417_1FASSET_CODE: TStringField;
    ADS417_1FASSET_NAME: TStringField;
    ADS417_1FASSET_DESC: TStringField;
    ADS417_1FASSET_TYPE: TStringField;
    ADS417_1equipment_grade: TStringField;
    ADS417_1DEPT_NAME: TStringField;
    ADS417_1LOCATION: TStringField;
    ADS417_1active_flag: TStringField;
    ADS417_1ABBR_NAME: TStringField;
    ADS417_1DeviType: TStringField;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn:TColumnEh;
     function UpdateValueToField(pDataSet:TDataSet;value:variant;FieldName:string):boolean;
  public
    { Public declarations }
    procedure Enter(rKey:integer);
  end;

var
  frm_MultiSelectItem: Tfrm_MultiSelectItem;

implementation

uses damo,MyClass,common;

{$R *.dfm}

{ Tfrm_MultiSelectItem }

procedure Tfrm_MultiSelectItem.Enter(rKey: integer);
begin

 // MyDataClass.UpdateValueToField(ADS417_1,checkbox1.Checked,'selected');
  //ads73clientds.Locate('rKey',rKey,[]);
end;

procedure Tfrm_MultiSelectItem.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker = smDownEh then
  begin
    Column.Title.SortMarker := smUpEh;
    ADS417_1.IndexFieldNames :=Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    ADS417_1.IndexFieldNames :=Column.FieldName+' DESC';
  end;

  if(PreColumn.FieldName<>Column.FieldName) and
     (Column.Field.DataType in [ftString,ftwideString]) then
  begin
    Label1.Caption :=Column.Title.Caption;
    Edit1.SetFocus;
    PreColumn.Title.Color :=clBtnFace;
    Column.Title.Color:=clRed;
    PreColumn :=Column;
  end
  else
    Edit1.SetFocus;
end;

procedure Tfrm_MultiSelectItem.FormShow(Sender: TObject);
begin
  PreColumn:=DBGridEh1.Columns[1];

  ADS417_1.Close;
  ADS417_1.Open;
end;

procedure Tfrm_MultiSelectItem.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(Chr(Key)='V') and (ssalt in shift) then
  ShowMessage(ADS417_1.CommandText);
end;

procedure Tfrm_MultiSelectItem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if ModalResult = mrok then
  begin
    try
      ADS417_1.DisableControls;
      MyDataClass.Set_Filter('selected=1',ADS417_1);
 //     ShowMessage(ADS417_1rKey.AsString);
      if ADS417_1.IsEmpty then
      begin
        ShowMsg('«Î—°‘Ò…Ë±∏',1);
        CanClose := False;
        ADS417_1.Filter:='';
        ADS417_1.Filtered := false;
        exit;
      end;
    finally
      ADS417_1.EnableControls;
    end;
  end;
end;

procedure Tfrm_MultiSelectItem.Edit1Change(Sender: TObject);
begin

  if Trim(Edit1.Text) <> '' then
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

function Tfrm_MultiSelectItem.UpdateValueToField(pDataSet: TDataSet;
  value: variant; FieldName: string): boolean;
var
  BookMark:Tbookmark;
begin
  try
    BookMark:=pDataSet.GetBookmark;
    pDataSet.DisableControls;
    try
      pDataSet.First;
      while not pDataSet.Eof do begin
        pDataSet.Edit;
        pDataSet.FieldByName(FieldName).Value := Value;
        pDataSet.Post;
        pDataSet.Next;
      end;
      result := true;
      if BookMark <> nil then
        pDataSet.GotoBookmark(BookMark);
    except
      result := false;
    end;
  finally
    pDataSet.FreeBookmark(Bookmark);
    pDataSet.EnableControls;
  end;
end;

procedure Tfrm_MultiSelectItem.CheckBox1Click(Sender: TObject);
begin
  UpdateValueToField(ADS417_1,checkbox1.Checked,'selected');
end;




end.
