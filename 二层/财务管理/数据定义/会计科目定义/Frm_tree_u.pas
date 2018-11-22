unit Frm_tree_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,PubFunc, DB, ADODB;

type
  TFrm_tree = class(TForm)
    TreeView1: TTreeView;
    procedure TreeView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    flay:boolean;   //ture for lowist
  public
    class function getStr(const Dt: TDataSet;lay:boolean;out sID,sNm:string;sCpt:string): integer;
  end;

var
  Frm_tree: TFrm_tree;

implementation



{$R *.dfm}

{ TFrm_tree }


class function TFrm_tree.getStr(const Dt: TDataSet;lay:boolean;out sID,sNm:string;sCpt:string): integer;
var s:string;
    i:integer;
    SavePlace: TBookmark;
begin
   result:=-1;
   Frm_tree:=TFrm_tree.Create(nil);
   try
     Frm_tree.flay:=lay;
     Frm_tree.Caption:=sCpt;
     SavePlace:=Dt.GetBookmark;
     pAnds(Frm_tree.TreeView1,Dt,nil,9999);
     Dt.GotoBookmark(SavePlace);
     Dt.FreeBookmark(SavePlace);

     Frm_tree.TreeView1.FullExpand;
     if Frm_tree.ShowModal=mrok then
     begin
        s:=Frm_tree.TreeView1.Selected.Text;
        i:=pos(' ',s);
        sID:=system.copy(s,1,i-1);
        sNm:=system.copy(s,i+1,length(s)-i);
        result:=integer(Frm_tree.TreeView1.Selected.Data^);
     end else abort;
   finally
     Frm_tree.Free;
   end;  
end;

procedure TFrm_tree.TreeView1DblClick(Sender: TObject);
begin
  if TTreeView(sender).Selected<>nil then
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
