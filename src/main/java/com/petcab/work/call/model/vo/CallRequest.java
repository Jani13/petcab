package com.petcab.work.call.model.vo;

import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CallRequest {
	private String sessionId;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof CallRequest)) {
            return false;
        }

        CallRequest that = (CallRequest) o;
        return Objects.equals(this.sessionId, that.sessionId);
    }

    @Override
    public int hashCode() {
        return sessionId.hashCode();
    }

    @Override
    public String toString() {
        return "CallRequest{" + "sessionId='" + sessionId + '\'' + '}';
    }
}
