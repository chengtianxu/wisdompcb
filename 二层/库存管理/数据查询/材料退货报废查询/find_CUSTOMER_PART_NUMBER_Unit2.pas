unit find_CUSTOMER_PART_NUMBER_Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Find_Unit1, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB,
  ADODB;

type
  Tfind_CUSTOMER_PART_NUMBER_Form2 = class(Tfind_Form1)
    ADOStoredProc1CUSTOMER_PART_NUMBER: TStringField;
    ADOStoredProc1CP_REV: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    vColumn1: TColumn;
  public
    { Public declarations }
  end;

var
  find_CUSTOMER_PART_NUMBER_Form2: Tfind_CUSTOMER_PART_NUMBER_Form2;

implementation

{$R *.dfm}

procedure Tfind_CUSTOMER_PART_NUMBER_Form2.Edit1Change(Sender: TObject);
begin
  inherited;
  ADOStoredProc1.Filter:='';
       //vColumn1.FieldName
  //showmessage(vColumn1.FieldName);

   if trim(edit1.text)<>'' then
   begin
     ADOStoredProc1.Filter :=vColumn1.FieldName+ ' like '''+trim(EDIT1.TEXT)+'%''';
   end
   else
     ADOStoredProc1.Filter:='';
end;

procedure Tfind_CUSTOMER_PART_NUMBER_Form2.DBGrid1DblClick(
  Sender: TObject);
begin
  inherited;
  Button1Click(sender);
end;

procedure Tfind_CUSTOMER_PART_NUMBER_Form2.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then
    Button1Click(sender);
end;

procedure Tfind_CUSTOMER_PART_NUMBER_Form2.Button1Click(Sender: TObject);
begin
  inherited;
  modalresult:=mrok;
end;

procedure Tfind_CUSTOMER_PART_NUMBER_Form2.FormShow(Sender: TObject);
begin
  inherited;
  vColumn1:=DBGrid1.Columns[0]; 
end;

procedure Tfind_CUSTOMER_PART_NUMBER_Form2.DBGrid1TitleClick(
  Column: TColumn);
begin
  inherited;
  edit1.Text :='';
  if vColumn1.Field.Name<>Column.Field.Name then
  begin
      vColumn1.Title.Color :=clBtnFace;
      vColumn1:=Column;
      vColumn1.Title.Color :=clRed;
      Label1.Caption :='  '+trim(vColumn1.Title.Caption) +':  ';
      ADOStoredProc1.Sort := vColumn1.FieldName ;
  end;
end;

end.
