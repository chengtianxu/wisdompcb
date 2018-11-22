unit QueryPick_CutnoShop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls,DBclient,DB, ADODB, Provider;
type
  TQueryPick_Cutno = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Eh1: TDBGridEh;
    ADS_pickitem: TADODataSet;
    DSP_pickitem: TDataSetProvider;
    CDS_pickitem: TClientDataSet;
    DS_pickitem: TDataSource;
    ADS_pickitemisselected: TBooleanField;
    ADS_pickitemrkey: TAutoIncField;
    ADS_pickitemCUT_NO: TStringField;
    ADS_pickitemPROD_CODE: TStringField;
    ADS_pickitemPRODUCT_NAME: TStringField;
    ADS_pickitemPRODUCT_DESC: TStringField;
    ADS_pickitemISSUE_DATE: TDateTimeField;
    ADS_pickitemSCH_COMPL_DATE: TDateTimeField;
    ADS_pickitemv_ttype: TStringField;
    ADS_pickitemDEPT_NAME: TStringField;
    ADS_pickitemABBR_NAME: TStringField;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure Eh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADS_pickitemAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    precolumn1:Tcolumneh;
  public
    { Public declarations }
  end;

var
  QueryPick_Cutno: TQueryPick_Cutno;

implementation

uses Query_DM,MyClass,common;

{$R *.dfm}

//全选
procedure TQueryPick_Cutno.CheckBox1Click(Sender: TObject);
begin
     MyDataClass.UpdateValueToField(CDS_pickitem,CheckBox1.Checked,'isselected');
end;
//单机标头
procedure TQueryPick_Cutno.Eh1TitleClick(Column: TColumnEh);
begin

   if CDS_pickitem.IndexName <> '' then
      begin
        CDS_pickitem.DeleteIndex('px');
        CDS_pickitem.IndexName := '';
      end;
    if Column.Title.SortMarker = smupeh then
      begin
        Column.Title.SortMarker := smDownEh;
        CDS_pickitem.AddIndex('px',Column.FieldName,[ixDescending]);
        CDS_pickitem.IndexName := 'px';
      end
    else
      begin
        column.Title.SortMarker:=smupeh;
       CDS_pickitem.AddIndex('px',column.FieldName,[ixPrimary]);
       CDS_pickitem.IndexName:='px';
      end;

    if (column.ReadOnly) and (precolumn1.FieldName<>column.FieldName) then
      begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
        label1.Caption:='搜索('+column.Title.Caption+')：';
        precolumn1.Title.Color:=clbtnface;
        column.Title.Color:=clred;
        precolumn1:=column;
        Edit1.Text:='';
      end;
      Edit1.SetFocus;

end;

procedure TQueryPick_Cutno.FormShow(Sender: TObject);
begin

      precolumn1:=Eh1.Columns[2];
      Eh1.Columns[2].Title.Color := clRed;
      Label1.Caption := Eh1.Columns[2].Title.Caption;

end;

procedure TQueryPick_Cutno.Edit1Change(Sender: TObject);
begin
  if precolumn1.ReadOnly=true then
  with CDS_pickitem do
  begin
        Filtered:=false;    // uppercase()
        filter:= precolumn1.FieldName+' like ''%'+trim(Edit1.Text)+'%''';
        Filtered:=true;
  end;
end;

procedure TQueryPick_Cutno.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if CDS_pickitem.IndexName<>'' then
    begin
      CDS_pickitem.DeleteIndex('px');
      CDS_pickitem.IndexName:='';
    end;
    CDS_pickitem.Filter:='';
    CDS_pickitem.Filtered:=false;
end;

procedure TQueryPick_Cutno.Eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (chr(key)='V') and (ssalt in shift) then
    showmessage( ADS_pickitem.CommandText);
end;

procedure TQueryPick_Cutno.ADS_pickitemAfterOpen(DataSet: TDataSet);
begin
      CDS_pickitem.Data := DSP_pickitem.Data;
end;


end.
