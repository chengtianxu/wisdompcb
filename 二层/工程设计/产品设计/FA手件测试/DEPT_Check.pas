unit DEPT_Check;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons,ConstVar;

type
  TFrmDEPTCheck = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
     v_close:byte;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDEPTCheck: TFrmDEPTCheck;

implementation

uses frm_new_u,uDM, Pick_Item_Single,uMain;

{$R *.dfm}

procedure TFrmDEPTCheck.Button2Click(Sender: TObject);
begin
    Close;

end;

procedure TFrmDEPTCheck.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TFrmDEPTCheck.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  {if v_close<>1 then
  begin
    Form1.ADOTable1.Cancel;
    Form1.Show;
  end;   }close;
end;

procedure TFrmDEPTCheck.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Close;
end;

end.
