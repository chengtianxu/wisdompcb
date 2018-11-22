unit QueryPick_BOMShop;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls,DBclient,DB, ADODB, Provider;

type
  TQueryPick_BOM = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Eh1: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
    ADS_pickitem: TADODataSet;
    ADS_pickitemisselected: TBooleanField;
    ADS_pickitemrkey: TAutoIncField;
    ADS_pickitemPROD_CODE: TStringField;
    ADS_pickitemPRODUCT_NAME: TStringField;
    ADS_pickitempart_name: TStringField;
    ADS_pickitemEMPLOYEE_NAME: TStringField;
    ADS_pickitemauth_date: TDateTimeField;
    DSP_pickitem: TDataSetProvider;
    CDS_pickitem: TClientDataSet;
    DS_pickitem: TDataSource;
    ADS_pickitemuser3_ptr: TStringField;
    ADS_pickitemauth3_date: TDateTimeField;
    CDS_pickitemisselected: TBooleanField;
    CDS_pickitemrkey: TAutoIncField;
    CDS_pickitemPROD_CODE: TStringField;
    CDS_pickitemPRODUCT_NAME: TStringField;
    CDS_pickitempart_name: TStringField;
    CDS_pickitemEMPLOYEE_NAME: TStringField;
    CDS_pickitemauth_date: TDateTimeField;
    CDS_pickitemuser3_ptr: TStringField;
    CDS_pickitemauth3_date: TDateTimeField;
    ADS_pickitemuser2_ptr: TStringField;
    ADS_pickitemauth2_date: TDateTimeField;
    CDS_pickitemuser2_ptr: TStringField;
    CDS_pickitemauth2_date: TDateTimeField;
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
  QueryPick_BOM: TQueryPick_BOM;

implementation

uses Query_DM,MyClass,common;

{$R *.dfm}

procedure TQueryPick_BOM.CheckBox1Click(Sender: TObject);
begin
     MyDataClass.UpdateValueToField(CDS_pickitem,CheckBox1.Checked,'isselected');
end;

procedure TQueryPick_BOM.Eh1TitleClick(Column: TColumnEh);
begin
    if CDS_pickitem.IndexName<>'' then
      begin
        CDS_pickitem.DeleteIndex('px');
        CDS_pickitem.IndexName:='';
      end;

      if column.Title.SortMarker=smupeh then
      begin
        column.Title.SortMarker:=smdowneh;
        CDS_pickitem.AddIndex('px',column.FieldName,[ixDescending]);
        CDS_pickitem.IndexName:='px';
      end
      else begin
        column.Title.SortMarker:=smupeh;
        cds_pickitem.AddIndex('px',column.FieldName,[ixPrimary]);
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

procedure TQueryPick_BOM.FormShow(Sender: TObject);
begin
     precolumn1:=Eh1.Columns[2];
     Eh1.Columns[2].Title.Color := clRed;
     Label1.Caption := Eh1.Columns[2].Title.Caption;
end;

procedure TQueryPick_BOM.Edit1Change(Sender: TObject);
begin

    if precolumn1.ReadOnly = True then
    with  CDS_pickitem do
      begin
        Filtered:=false;    //uppercase()
        filter:=precolumn1.FieldName+' like''%'+trim(Edit1.Text)+'%''';
        Filtered:=true;
      end; 
end;

procedure TQueryPick_BOM.FormCloseQuery(Sender: TObject;
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

procedure TQueryPick_BOM.Eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (chr(key)='V') and (ssalt in shift) then
    showmessage( ADS_pickitem.CommandText); 
end;

procedure TQueryPick_BOM.ADS_pickitemAfterOpen(DataSet: TDataSet);
begin
     CDS_pickitem.Data := DSP_pickitem.Data;
end;






end.
