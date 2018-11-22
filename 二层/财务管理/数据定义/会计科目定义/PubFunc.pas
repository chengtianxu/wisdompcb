unit PubFunc;

interface
  uses
   SysUtils,windows,Controls,Forms,Classes,DB, ADODB,ComCtrls,Menus,
   DBClient,MConnect, Graphics;

  type
   TcdsState = (ad,ed,de,bo,Au);

   procedure pAnds(tree: TTreeView; Dt: TDataset; node: TTreeNode;iRoot: integer);

implementation


procedure pAnds(tree: TTreeView; Dt: TDataset; node: TTreeNode;iRoot: integer);
var sp,sp1:integer;
    node1:TTreeNode;
    sv:variant;
    SavePlace: TBookmark;
    pI:^integer;
begin
  Dt.Filtered:=false;
  Dt.Filter:=Dt.Fields[1].FullName+'='+inttostr(iRoot);
  Dt.Filtered:=true;
  if  Dt.IsEmpty then  exit;
  while not Dt.Eof do
  begin
     sp:=Dt.Fields[0].AsInteger ;
     sp1:=Dt.Fields[1].AsInteger ;
     new(pI);
     pI^:=sp;
     node1:=Tree.Items.AddChild(node,Dt.Fields[2].asstring) ;
     node1.Data:=pI;
     SavePlace:=Dt.GetBookmark;
     pAnds(tree,Dt,node1,sp);

     Dt.Filtered:=false;
     Dt.Filter:=Dt.Fields[1].FullName+'='+inttostr(sp1);
     Dt.Filtered:=true;
     Dt.GotoBookmark(SavePlace);

     Dt.FreeBookmark(SavePlace);
     Dt.next;
  end;

  Dt.Filtered:=false;
end;

end.
