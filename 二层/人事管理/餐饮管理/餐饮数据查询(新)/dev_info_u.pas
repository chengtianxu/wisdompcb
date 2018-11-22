unit dev_info_u;

interface

uses
  Classes, Controls, Forms,
  DBGrids, damo, Menus, StdCtrls, DBCtrls, db, Mask, Grids, ExtCtrls;

type
  TDevinfo = class(TForm)
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Label9: TLabel;
    Panel1: TPanel;
    Label10: TLabel;
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Label9MouseEnter(Sender: TObject);
    procedure Label9MouseLeave(Sender: TObject);
  private
    { Private declarations }
    procedure dbtextreadonly(tf:Boolean);
  public
    { Public declarations }
  end;

var
  Devinfo: TDevinfo;

implementation

{$R *.dfm}

procedure TDevinfo.N2Click(Sender: TObject);
begin
  N2.Checked:= not n2.Checked;
  DM.ADOTMP2.Filtered:=not N2.Checked;
end;

procedure TDevinfo.N1Click(Sender: TObject);
begin
  DM.ADOTMP2.Edit;
  dbtextreadonly(False);
end;

procedure TDevinfo.dbtextreadonly(tf: Boolean);
var
  i:Integer;
begin
  for i:=0 to ControlCount-1 do
  if Controls[i].ClassName='TDBEdit' then
  (Controls[i] as TDBEdit).ReadOnly:=tf;
  Button1.Visible:=not tf;
  Button2.Visible:=not tf;
end;

procedure TDevinfo.Button1Click(Sender: TObject);
begin
  DM.ADOTMP2.Post;
  dbtextreadonly(True);
end;

procedure TDevinfo.Button2Click(Sender: TObject);
begin
  DM.ADOTMP2.Cancel;
  dbtextreadonly(True);
end;

procedure TDevinfo.FormCreate(Sender: TObject);
begin
  DM.ADOTMP2.Active:=True;
  if Hint<>'3' then
  DBGrid1.PopupMenu:=PopupMenu1;
  dbtextreadonly(True);
end;

procedure TDevinfo.DBGrid1CellClick(Column: TColumn);
begin
  if (DM.adotmp2.State<> dsedit) then
  dbtextreadonly(True);
end;

procedure TDevinfo.Label9MouseEnter(Sender: TObject);
begin
  Panel1.Visible:=True;
  Panel1.Top:=Label9.Top+Label9.Height-Panel1.Height;
  Panel1.Left:=Label9.Left-2-Panel1.Width;
end;

procedure TDevinfo.Label9MouseLeave(Sender: TObject);
begin
  Panel1.Visible:=False;
end;

end.
