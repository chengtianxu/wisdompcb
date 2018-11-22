unit findUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfindForm2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOStoredProc1: TADOStoredProc;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     vColumn1: TColumn;
    { Public declarations }
  end;

var
  findForm2: TfindForm2;

implementation

{$R *.dfm}

procedure TfindForm2.BitBtn1Click(Sender: TObject);
begin
  edit1.Text:='';
  edit1.SetFocus;
end;

procedure TfindForm2.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not DBGrid1.DataSource.DataSet.Active then  exit;
 if not (gdFixed in State) then
 begin
  if DBGrid1.DataSource.DataSet.RecNo  mod 2 = 0 then
    (Sender as TDBGrid).Canvas.Brush.Color := clwhite //定义背景颜色
  else
    (Sender as TDBGrid).Canvas.Brush.Color := RGB(244,241,255); //定义背景颜色
    
  if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
     (Sender as TDBGrid).Canvas.Brush.Color := RGB(0,224,224); //定义背景颜色
     
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

end;

procedure TfindForm2.Button2Click(Sender: TObject);
begin
  modalresult:=mrCancel	;
end;

procedure TfindForm2.Edit1Change(Sender: TObject);
begin
  if not DBGrid1.DataSource.DataSet.Active then  exit;
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

procedure TfindForm2.DBGrid1DblClick(Sender: TObject);
begin
  Button1Click(sender);
end;

procedure TfindForm2.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button1Click(sender);
end;

procedure TfindForm2.DBGrid1TitleClick(Column: TColumn);
begin
  if not DBGrid1.DataSource.DataSet.Active then  exit;
  edit1.Text :='';
  
  //if  vColumn1.FieldName<>Column.FieldName then
  //if vColumn1.Field.Name<>Column.Field.Name then
  begin
      vColumn1.Title.Color :=clBtnFace;
      vColumn1:=Column;
      vColumn1.Title.Color :=clRed;
      Label1.Caption :='  '+trim(vColumn1.Title.Caption) +':  ';
      ADOStoredProc1.Sort := vColumn1.FieldName ;
  end;
end;

procedure TfindForm2.Button1Click(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TfindForm2.FormShow(Sender: TObject);
begin
  vColumn1:=nil;
end;

end.
