unit Frm_tree_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ADODB;

type
  TFrm_tree = class(TForm)
    TreeView1: TTreeView;
    procedure TreeView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    flay:boolean;   //ture for lowist
  public
    procedure CreateTree(const Dt: TDataSet;iRoot: integer;lay:boolean;sCpt:string;rootNodCap:string);
    { Public declarations }
  end;

var
  Frm_tree: TFrm_tree;

implementation

uses common;

{$R *.dfm}


procedure TFrm_tree.CreateTree(const Dt: TDataSet;iRoot: integer;lay:boolean;sCpt:string;rootNodCap:string);
var
    node:TTreeNode;
begin
   Frm_tree.flay:=lay;
   Frm_tree.Caption:=sCpt;
   Dt.Filtered:=false;
   node:=Frm_tree.TreeView1.Items.AddChild(nil,rootNodCap);
   pAnds(Frm_tree.TreeView1, Dt, node,iRoot);
end;

procedure TFrm_tree.TreeView1DblClick(Sender: TObject);
begin
  if (TTreeView(sender).Selected<>nil) and (TTreeView(sender).Selected.Level>0) then
  begin
    if flay and not TTreeView(sender).Selected.HasChildren then
      ModalResult:=mrok
    else if not flay   then
      ModalResult:=mrok;
  end;
end;

procedure TFrm_tree.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then close;
  if key=vk_return then TreeView1DblClick(Sender);
end;

end.
