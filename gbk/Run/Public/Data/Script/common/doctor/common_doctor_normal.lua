--���ܣ���ͨҽ��


x300411_g_ScriptId = 300411
x300411_g_MissionName="�������"
--**********************************

--������ں���

--**********************************

function x300411_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "���ˣ��Ժ���ȥð�յ�ʱ�򣬼ǵ�Ҫʱ��ע���Լ��İ�Σ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	
	local hp = 0;
	local mp = 0;
	
	hp = RestoreHp(sceneId, selfId)
	local MenPai= GetMenPai( sceneId, playerId)
	if MenPai~=0 then
		mp = RestoreMp(sceneId, selfId)
	end
	
	if( hp == 0 or mp == 0 ) then 
		strText = "��ȫ��ָ��˽���"
	else
		strText = "��ܽ���������Ҫ�ָ�"
	end
	
		BeginEvent(sceneId)
		AddText(sceneId,strText);
		EndEvent(sceneId)	
		DispatchMissionTips(sceneId,selfId)
	
end



--**********************************

--�о��¼�

--**********************************

function x300411_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300411_g_ScriptId, x300411_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300411_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300411_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300411_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300411_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300411_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300411_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300411_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300411_OnItemChanged(sceneId, selfId, itemdataId)

end