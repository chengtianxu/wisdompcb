unit MaterielFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, ExtCtrls;

type
  TFrm_Materiel = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADS17: TADODataSet;
    ADS17selected: TBooleanField;
    ADS17RKEY: TAutoIncField;
    ADS17INV_PART_NUMBER: TStringField;
    ADS17INV_NAME: TStringField;
    ADS17INV_DESCRIPTION: TStringField;
    ADS17STOP_PURCH1: TStringField;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    ADS17UNIT_NAME: TStringField;
    ADS17STOCK_UNIT_PTR: TIntegerField;
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
  private
    { Private declarations }
     PreColumn:TColumnEh;
     function UpdateValueToField(pDataSet:TDataSet;value:variant;FieldName:string):boolean;
  public
    { Public declarations }
     
  end;

var
  Frm_Materiel: TFrm_Materiel;

implementation

uses damo,MyClass,common;

{$R *.dfm}

function TFrm_Materiel.UpdateValueToField(pDataSet: TDataSet;
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

procedure TFrm_Materiel.CheckBox1Click(Sender: TObject);
begin
  UpdateValueToField(ADS17,checkbox1.Checked,'selected');
end;

procedure TFrm_Materiel.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text) <> '' then
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TFrm_Materiel.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if ModalResult = mrok then
  begin
    try
      ADS17.DisableControls;
      MyDataClass.Set_Filter('selected=1',ADS17);
      if ADS17.IsEmpty then
      begin
        ShowMsg('«Î—°‘Ò≤ƒ¡œ',1);
        CanClose := False;
        ADS17.Filter:='';
        ADS17.Filtered := false;
        exit;
      end;
    finally
      ADS17.EnableControls;
    end;
  end;
end;

procedure TFrm_Materiel.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Chr(Key)='V') and (ssalt in shift) then
  ShowMessage(ADS17.CommandText);
end;

procedure TFrm_Materiel.FormShow(Sender: TObject);
begin
  PreColumn:=DBGridEh1.Columns[1];
  ADS17.Close;
  ADS17.Open;
end;

procedure TFrm_Materiel.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker = smDownEh then
  begin
    Column.Title.SortMarker := smUpEh;
    ADS17.IndexFieldNames :=Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    ADS17.IndexFieldNames :=Column.FieldName+' DESC';
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

end.
