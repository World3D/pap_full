--���ܽű�
--����������ͶƱ
--MisDescBegin
x300309_g_ScriptId = 300309
x300309_g_MissionId = 400
x300309_g_Name	="������" 
x300309_g_MissionName="��Ҫ����"

--**********************************


--������ں���

--**********************************

function x300309_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�


		BeginEvent(sceneId)
	
			AddText(sceneId,"#Y".."���Ƿ�ȷ��Ҫ����������")
			
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x300309_g_ScriptId, x300309_g_MissionId)

	
end



--**********************************

--�о��¼�

--**********************************

function x300309_OnEnumerate(sceneId, selfId, targetId)


		AddNumText(sceneId, x300309_g_ScriptId, x300309_g_MissionName)

	
end



--**********************************

--����������

--**********************************

function x300309_CheckAccept(sceneId, selfId, targetId)


	CountryDeletaBegin( sceneId, selfId );
	CountryVoteBegin(sceneId, selfId);
	--��Ӵ�������

return 1

end


--**********************************

--���鿴����

--**********************************

function x300309_CheckPushList(sceneId, selfId, targetId)
--	if (sceneId==15) then
--		if IsMissionHaveDone(sceneId, selfId, x300309_g_MissionIdPre) > 0 then
--       	    	return 1
--        	end
--        end
--        return 0
	
end

--**********************************

--����

--**********************************

function x300309_OnAccept(sceneId, selfId)

	  BeginEvent(sceneId)
			AddText(sceneId,"�����ɹ�") 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)		                                               
	     
end



--**********************************

--����

--**********************************

function x300309_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300309_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300309_OnSubmit(sceneId, selfId, targetId, selectRadioId)

end



--**********************************

--ɱ����������

--**********************************

function x300309_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300309_OnEnterArea(sceneId, selfId, zoneId)
		AddNumText(sceneId, x300309_g_ScriptId, "��������")
end



--**********************************

--���߸ı�

--**********************************

function x300309_OnItemChanged(sceneId, selfId, itemdataId)

end

