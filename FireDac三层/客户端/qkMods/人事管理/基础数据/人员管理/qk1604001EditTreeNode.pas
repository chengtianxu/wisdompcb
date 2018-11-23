unit qk1604001EditTreeNode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditVGridFrm, Data.DB, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBVertGridsEh, Vcl.ExtCtrls, RzButton, RzPanel,
  qkFunc.Commfunc, MemTableEh;

type
  Tfrmqk1604001edittreenode = class(Tfrmqkbaseeditvgrid)
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fmteh: TMemTableEh; //判断是否可以更改节点
  end;



implementation

{$R *.dfm}

procedure Tfrmqk1604001edittreenode.btnSaveClick(Sender: TObject);
var
  I: Integer;
begin
  if not CheckNotNull then
    Exit;

  qkCommfunc.SetCurrIDKey(DataSet);
  if DataSet.FieldByName('ParentNodeIDKey').AsLargeInt = DataSet.FieldByName('IDKey').AsLargeInt then
  begin
    qkDialog.CanNotSetParetnNoteToSelf;
    Exit;
  end;
  DataSet.Post;

  //--检测是否可以移动到目标节点
  try
    for I := 0 to fmteh.FieldCount - 1 do
      fmteh.Fields[I].Value := DataSet.FieldByName(fmteh.Fields[I].FieldName).Value;
    fmteh.Post;
    fmteh.MergeChangeLog;
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
      //Fmteh.Cancel;
      //DataSet.UndoLastChange(True);
      Exit;
    end;
  end;

  PostTableArr := 'HR_DeptDef';
  PostDsList.Add(DataSet);
  if PostDataArr then
  begin
    qkDialog.SaveSucc;
    ModalResult := mrOk;
  end;
end;

end.
