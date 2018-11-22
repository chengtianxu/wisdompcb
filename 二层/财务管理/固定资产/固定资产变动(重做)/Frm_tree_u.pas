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
    class function getStr(const Dt: TDataSet;iRoot: integer;lay:boolean;sCpt:string;rootNodCap:string): boolean;
    { Public declarations }
  end;

var
  Frm_tree: TFrm_tree;

implementation

uses common;

{$R *.dfm}


class function TFrm_tree.getStr(const Dt: TDataSet;iRoot: integer;lay:boolean;sCpt:string;rootNodCap:string): boolean;
var
    node:TTreeNode;
begin
   result:=false;
   Frm_tree:=TFrm_tree.Create(nil);
   try
     Frm_tree.flay:=lay;
     Frm_tree.Caption:=sCpt;
     Dt.Filtered:=false;
     node:=Frm_tree.TreeView1.Items.AddChild(nil,rootNodCap);
     pAnds(Frm_tree.TreeView1, Dt, node,iRoot);
    // Frm_tree.TreeView1.FullExpand;
     if Frm_tree.ShowModal=mrok then
       result:=Dt.Locate(Dt.Fields[0].fullname,integer(Frm_tree.TreeView1.Selected.Data^),[]);
   finally
     Frm_tree.Free;
   end;
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
