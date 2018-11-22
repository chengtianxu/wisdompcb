unit Find_Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB,DMUnit1, ADODB;

type
  Tfind_Form1 = class(TForm)
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
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  find_Form1: Tfind_Form1;

implementation

{$R *.dfm}

procedure Tfind_Form1.BitBtn1Click(Sender: TObject);
begin
  edit1.Text:='';
  edit1.SetFocus;
end;

procedure Tfind_Form1.Button2Click(Sender: TObject);
begin
  modalresult:=mrCancel	;
end;

procedure Tfind_Form1.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
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

procedure Tfind_Form1.FormCreate(Sender: TObject);
begin
  self.BorderIcons := self.BorderIcons - [biMinimize] - [biMaximize];
  self.BorderStyle  := bsSingle;
  self.Position := poScreenCenter;
end;

end.
