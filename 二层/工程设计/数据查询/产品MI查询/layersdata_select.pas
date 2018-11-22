unit layersdata_select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TForm_layersdata = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TreeView1: TTreeView;
    rkey25: TLabel;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_layersdata: TForm_layersdata;

implementation

uses damo, product_MIDetail;

{$R *.dfm}

procedure TForm_layersdata.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
 rkey25.Caption:=inttostr(Pinteger(Node.data)^);
 node.SelectedIndex:=4;
end;

end.
